import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  static const _authorNameKey = 'community_author_name';
  static const _savedStoriesKey = 'saved_story_ids';
  static const _storyDraftKey = 'community_story_draft';
  static const int maxStories = 100;

  CollectionReference<Map<String, dynamic>> get _stories =>
      FirebaseFirestore.instance.collection('stories');

  CollectionReference<Map<String, dynamic>> get _reports =>
      FirebaseFirestore.instance.collection('reports');

  /// This device's Firebase Anonymous Auth uid — a real, server-verifiable
  /// identity backing every Community Stories write, so Firestore security
  /// rules can check request.auth.uid against a story's stored userId.
  /// Replaces the old client-generated random id, which had no way to prove
  /// itself server-side. Retries sign-in once if main.dart's startup attempt
  /// didn't leave a signed-in user (e.g. a transient network failure, or
  /// Anonymous Auth not yet enabled in the Firebase console).
  static Future<String> userId() async {
    var user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      final credential = await FirebaseAuth.instance.signInAnonymously();
      user = credential.user;
    }
    return user!.uid;
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

  /// Live view of one story document — the full-screen detail view keeps
  /// its reaction/comment counts current through this. Null once deleted.
  Stream<CommunityStory?> storyById(String id) {
    return _stories
        .doc(id)
        .snapshots()
        .map((doc) => doc.exists ? CommunityStory.fromDoc(doc) : null);
  }

  /// The current user's own pending submissions, newest first — shown only
  /// to them (matched by userId) so a new story doesn't just disappear
  /// into moderation. Equality-only filters: no composite index needed.
  Stream<List<CommunityStory>> myPendingStories() async* {
    final uid = await userId();
    yield* _stories
        .where('status', isEqualTo: 'pending')
        .where('userId', isEqualTo: uid)
        .limit(10)
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

  // ── Story draft (local, one at a time) ────────────────────────────────────

  /// The locally saved submit-form draft, or null if none (or unreadable).
  static Future<Map<String, dynamic>?> savedStoryDraft() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_storyDraftKey);
    if (raw == null || raw.isEmpty) return null;
    try {
      return jsonDecode(raw) as Map<String, dynamic>;
    } catch (_) {
      return null;
    }
  }

  static Future<void> saveStoryDraft(Map<String, dynamic> draft) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_storyDraftKey, jsonEncode(draft));
  }

  static Future<void> clearStoryDraft() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_storyDraftKey);
  }

  // ── Saved stories (local bookmarks) ───────────────────────────────────────

  static Future<Set<String>> savedStoryIds() async {
    final prefs = await SharedPreferences.getInstance();
    return (prefs.getStringList(_savedStoriesKey) ?? const []).toSet();
  }

  /// Adds the id if absent, removes it if present; returns the new set.
  static Future<Set<String>> toggleSavedStory(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final ids = (prefs.getStringList(_savedStoriesKey) ?? const []).toSet();
    if (!ids.add(id)) ids.remove(id);
    await prefs.setStringList(_savedStoriesKey, ids.toList());
    return ids;
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

  /// Writes the story with status "pending" for moderation in the Firebase
  /// console. Photo upload is deferred to v1.1 — cards fall back to the
  /// Bismillah placeholder unless a photoUrl is set manually in the console.
  Future<void> submitStory({
    required String name,
    required bool anonymous,
    required String country,
    required String countryFlag,
    required StoryCategory category,
    DateTime? shahadaDate,
    required String story,
    required String language,
    String? backgroundImage,
    String avatarType = 'initials',
    String? avatarData,
  }) async {
    await _stories.add({
      'userId': await userId(),
      'avatarType': avatarType,
      if (avatarData != null) 'avatarData': avatarData,
      'name': name.trim(),
      'anonymous': anonymous,
      'country': country,
      'countryFlag': countryFlag,
      'category': category.id,
      if (shahadaDate != null) 'shahadaDate': Timestamp.fromDate(shahadaDate),
      'story': story.trim(),
      if (backgroundImage != null) 'backgroundImage': backgroundImage,
      'status': 'pending',
      'featured': false,
      'reactions': {'dua': 0, 'heart': 0},
      'commentCount': 0,
      'dateSubmitted': FieldValue.serverTimestamp(),
      'language': language,
    });
  }

  /// Direct edit of the user's own already-approved story. Deliberately does
  /// NOT touch status/featured/reactions/dateSubmitted — first submission
  /// goes through moderation once; edits after approval stay approved.
  Future<void> updateStory({
    required String id,
    required String name,
    required bool anonymous,
    required String country,
    required String countryFlag,
    required StoryCategory category,
    DateTime? shahadaDate,
    required String story,
    required String language,
    String? backgroundImage,
    String avatarType = 'initials',
    String? avatarData,
  }) async {
    await _stories.doc(id).update({
      'avatarType': avatarType,
      'avatarData': avatarData ?? FieldValue.delete(),
      'name': name.trim(),
      'anonymous': anonymous,
      'country': country,
      'countryFlag': countryFlag,
      'category': category.id,
      'shahadaDate': shahadaDate != null
          ? Timestamp.fromDate(shahadaDate)
          : FieldValue.delete(),
      'story': story.trim(),
      'backgroundImage': backgroundImage ?? FieldValue.delete(),
      'language': language,
    });
  }

  // ── Reports & moderation ──────────────────────────────────────────────────

  /// Files a report against a story with status "pending"; reviewed in the
  /// in-app admin panel (Settings → Admin Mode).
  Future<void> reportStory({
    required String storyId,
    required String reason,
    required String storyAuthorId,
  }) async {
    await _reports.add({
      'storyId': storyId,
      'reportedAt': FieldValue.serverTimestamp(),
      'reason': reason,
      'storyAuthorId': storyAuthorId,
      'status': 'pending',
    });
  }

  /// EVERY user's pending submissions, newest first — the admin moderation
  /// queue (unlike [myPendingStories], which is filtered to this install).
  Stream<List<CommunityStory>> allPendingStories() {
    return _stories
        .where('status', isEqualTo: 'pending')
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

  /// Unresolved reports, newest first (client-side sort — equality-only
  /// filter, so no composite index needed).
  Stream<List<StoryReport>> pendingReports() {
    return _reports
        .where('status', isEqualTo: 'pending')
        .limit(100)
        .snapshots()
        .map((snap) {
      final reports = snap.docs.map(StoryReport.fromDoc).toList();
      reports.sort((a, b) {
        final da = a.reportedAt, db = b.reportedAt;
        if (da == null && db == null) return 0;
        if (da == null) return 1;
        if (db == null) return -1;
        return db.compareTo(da);
      });
      return reports;
    });
  }

  /// Admin approve/reject: 'approved' shows the story in the public feed,
  /// 'rejected' removes it (the feed queries status == 'approved' only).
  Future<void> setStoryStatus(String storyId, String status) =>
      _stories.doc(storyId).update({'status': status});

  /// Admin "Delete Story": removes the story document entirely.
  Future<void> deleteStory(String storyId) => _stories.doc(storyId).delete();

  /// Admin "Dismiss": marks one report handled without touching the story.
  Future<void> resolveReport(String reportId) =>
      _reports.doc(reportId).update({'status': 'resolved'});
}
