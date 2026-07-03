import 'dart:math';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/community_story.dart';

/// Firestore/Storage access for Community Stories.
///
/// Queries deliberately use only equality filters (no orderBy) so no
/// composite indexes have to be created in the Firebase console — sorting
/// and category filtering happen client-side, which is fine at this scale
/// (stories are human-moderated one by one).
class CommunityStoriesService {
  /// Set in main.dart. False until `flutterfire configure` has been run —
  /// all UI entry points hide themselves while this is false.
  static bool firebaseAvailable = false;

  static const _userIdKey = 'community_user_id';
  static const _authorNameKey = 'community_author_name';
  static const int maxStories = 100;

  static String? _cachedUserId;

  CollectionReference<Map<String, dynamic>> get _stories =>
      FirebaseFirestore.instance.collection('stories');

  /// Stable anonymous per-install user id for reactions/comments.
  static Future<String> userId() async {
    final cached = _cachedUserId;
    if (cached != null) return cached;
    final prefs = await SharedPreferences.getInstance();
    var id = prefs.getString(_userIdKey);
    if (id == null) {
      final rand = Random();
      id = List.generate(20, (_) => rand.nextInt(36).toRadixString(36)).join();
      await prefs.setString(_userIdKey, id);
    }
    _cachedUserId = id;
    return id;
  }

  /// Remembered display name from the user's last submission/comment.
  static Future<String> savedAuthorName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_authorNameKey) ?? '';
  }

  static Future<void> rememberAuthorName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_authorNameKey, name.trim());
  }

  /// All approved stories, newest first (client-side sort).
  Stream<List<CommunityStory>> approvedStories() {
    return _stories
        .where('status', isEqualTo: 'approved')
        .limit(maxStories)
        .snapshots()
        .map((snap) {
      final stories = snap.docs.map(CommunityStory.fromDoc).toList();
      stories.sort((a, b) {
        final da = a.dateSubmitted, db = b.dateSubmitted;
        if (da == null && db == null) return 0;
        if (da == null) return 1;
        if (db == null) return -1;
        return db.compareTo(da);
      });
      return stories;
    });
  }

  /// The latest approved story marked `featured: true` (for the home card
  /// and the featured slot at the top of the stories screen).
  Stream<CommunityStory?> featuredStory() {
    return _stories
        .where('status', isEqualTo: 'approved')
        .where('featured', isEqualTo: true)
        .limit(10)
        .snapshots()
        .map((snap) {
      if (snap.docs.isEmpty) return null;
      final stories = snap.docs.map(CommunityStory.fromDoc).toList();
      stories.sort((a, b) {
        final da = a.dateSubmitted, db = b.dateSubmitted;
        if (da == null && db == null) return 0;
        if (da == null) return 1;
        if (db == null) return -1;
        return db.compareTo(da);
      });
      return stories.first;
    });
  }

  // ── Reactions ─────────────────────────────────────────────────────────────

  /// This user's own reactions on one story.
  Stream<UserReactions> userReactions(String storyId) async* {
    final uid = await userId();
    yield* _stories
        .doc(storyId)
        .collection('userReactions')
        .doc(uid)
        .snapshots()
        .map((doc) {
      final data = doc.data() ?? const {};
      return UserReactions(
        dua: data['dua'] as bool? ?? false,
        heart: data['heart'] as bool? ?? false,
      );
    });
  }

  /// Toggles one reaction ('dua' or 'heart') for this user, keeping the
  /// aggregate count on the story document in sync — one reaction of each
  /// kind per user, tap again to remove.
  Future<void> toggleReaction(String storyId, String kind) async {
    final uid = await userId();
    final storyRef = _stories.doc(storyId);
    final reactionRef = storyRef.collection('userReactions').doc(uid);

    await FirebaseFirestore.instance.runTransaction((tx) async {
      final reactionDoc = await tx.get(reactionRef);
      final already = (reactionDoc.data() ?? const {})[kind] as bool? ?? false;
      tx.set(reactionRef, {kind: !already}, SetOptions(merge: true));
      tx.update(storyRef, {
        'reactions.$kind': FieldValue.increment(already ? -1 : 1),
      });
    });
  }

  // ── Comments ──────────────────────────────────────────────────────────────

  Stream<List<StoryComment>> comments(String storyId) {
    return _stories
        .doc(storyId)
        .collection('comments')
        .orderBy('timestamp', descending: true)
        .limit(100)
        .snapshots()
        .map((snap) => snap.docs.map(StoryComment.fromDoc).toList());
  }

  Future<void> addComment({
    required String storyId,
    required String name,
    required String comment,
  }) async {
    final uid = await userId();
    final storyRef = _stories.doc(storyId);
    await storyRef.collection('comments').add({
      'userId': uid,
      'name': name.trim(),
      'comment': comment.trim(),
      'timestamp': FieldValue.serverTimestamp(),
    });
    await storyRef.update({'commentCount': FieldValue.increment(1)});
  }

  // ── Submit ────────────────────────────────────────────────────────────────

  /// Uploads an optional photo, then writes the story with status "pending"
  /// for moderation in the Firebase console.
  Future<void> submitStory({
    required String name,
    required bool anonymous,
    required String country,
    required String countryFlag,
    required StoryCategory category,
    DateTime? shahadaDate,
    required String story,
    Uint8List? photoBytes,
    required String language,
  }) async {
    String? photoUrl;
    if (photoBytes != null) {
      final ref = FirebaseStorage.instance.ref(
          'stories/${DateTime.now().millisecondsSinceEpoch}_${await userId()}.jpg');
      await ref.putData(
          photoBytes, SettableMetadata(contentType: 'image/jpeg'));
      photoUrl = await ref.getDownloadURL();
    }

    await _stories.add({
      'name': name.trim(),
      'anonymous': anonymous,
      'country': country,
      'countryFlag': countryFlag,
      'category': category.id,
      if (shahadaDate != null) 'shahadaDate': Timestamp.fromDate(shahadaDate),
      'story': story.trim(),
      if (photoUrl != null) 'photoUrl': photoUrl,
      'status': 'pending',
      'featured': false,
      'reactions': {'dua': 0, 'heart': 0},
      'commentCount': 0,
      'dateSubmitted': FieldValue.serverTimestamp(),
      'language': language,
    });
  }
}
