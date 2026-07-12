import 'package:cloud_firestore/cloud_firestore.dart';

/// Story categories used in Firestore's `category` field.
enum StoryCategory {
  revert('revert'),
  bornMuslim('born_muslim'),
  returning('returning');

  final String id;
  const StoryCategory(this.id);

  static StoryCategory fromId(String? id) => StoryCategory.values.firstWhere(
        (c) => c.id == id,
        orElse: () => StoryCategory.revert,
      );
}

/// One community story document (collection: `stories`).
class CommunityStory {
  final String id;
  final String name;
  final bool anonymous;
  final String country;
  final String countryFlag;
  final StoryCategory category;
  final DateTime? shahadaDate;
  final String story;
  final String? photoUrl;

  /// Bundled asset path chosen at submission time (e.g.
  /// "assets/images/mosques/mosque_3.jpg"); null = no background.
  final String? backgroundImage;

  /// Anonymous per-install id of the submitter — lets the author edit their
  /// own story. Null on stories submitted before this field existed.
  final String? userId;

  /// Avatar style: 'initials' (default), 'icon' or 'pattern'.
  final String? avatarType;

  /// Icon id for 'icon' avatars, seed string for 'pattern' avatars.
  final String? avatarData;
  final bool featured;
  final int duaCount;
  final int heartCount;
  final int commentCount;
  final DateTime? dateSubmitted;

  const CommunityStory({
    required this.id,
    required this.name,
    required this.anonymous,
    required this.country,
    required this.countryFlag,
    required this.category,
    this.shahadaDate,
    required this.story,
    this.photoUrl,
    this.backgroundImage,
    this.userId,
    this.avatarType,
    this.avatarData,
    required this.featured,
    required this.duaCount,
    required this.heartCount,
    required this.commentCount,
    this.dateSubmitted,
  });

  /// Initials for the avatar circle, e.g. "Yusuf Ali" → "YA".
  String get initials {
    final parts =
        name.trim().split(RegExp(r'\s+')).where((p) => p.isNotEmpty).toList();
    if (parts.isEmpty) return '؟';
    if (parts.length == 1) return parts.first.substring(0, 1).toUpperCase();
    return (parts.first.substring(0, 1) + parts.last.substring(0, 1))
        .toUpperCase();
  }

  factory CommunityStory.fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data() ?? const {};
    final reactions = (data['reactions'] as Map<String, dynamic>?) ?? const {};
    return CommunityStory(
      id: doc.id,
      name: (data['name'] as String?)?.trim() ?? '',
      anonymous: data['anonymous'] as bool? ?? false,
      country: data['country'] as String? ?? '',
      countryFlag: data['countryFlag'] as String? ?? '',
      category: StoryCategory.fromId(data['category'] as String?),
      shahadaDate: (data['shahadaDate'] as Timestamp?)?.toDate(),
      story: data['story'] as String? ?? '',
      photoUrl: data['photoUrl'] as String?,
      backgroundImage: data['backgroundImage'] as String?,
      userId: data['userId'] as String?,
      avatarType: data['avatarType'] as String?,
      avatarData: data['avatarData'] as String?,
      featured: data['featured'] as bool? ?? false,
      duaCount: (reactions['dua'] as num?)?.toInt() ?? 0,
      heartCount: (reactions['heart'] as num?)?.toInt() ?? 0,
      commentCount: (data['commentCount'] as num?)?.toInt() ?? 0,
      dateSubmitted: (data['dateSubmitted'] as Timestamp?)?.toDate(),
    );
  }
}

/// One comment (subcollection: `stories/{id}/comments`).
class StoryComment {
  final String id;
  final String name;
  final String comment;
  final DateTime? timestamp;

  const StoryComment({
    required this.id,
    required this.name,
    required this.comment,
    this.timestamp,
  });

  factory StoryComment.fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data() ?? const {};
    return StoryComment(
      id: doc.id,
      name: (data['name'] as String?)?.trim() ?? '',
      comment: data['comment'] as String? ?? '',
      timestamp: (data['timestamp'] as Timestamp?)?.toDate(),
    );
  }
}

/// One report filed against a story (collection: `reports`). `reason` is a
/// canonical id ('inappropriate' | 'spam' | 'hate_speech' | 'other') so the
/// admin panel can show it localized.
class StoryReport {
  final String id;
  final String storyId;
  final String reason;
  final String storyAuthorId;
  final String status;
  final DateTime? reportedAt;

  const StoryReport({
    required this.id,
    required this.storyId,
    required this.reason,
    required this.storyAuthorId,
    required this.status,
    this.reportedAt,
  });

  factory StoryReport.fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data() ?? const {};
    return StoryReport(
      id: doc.id,
      storyId: data['storyId'] as String? ?? '',
      reason: data['reason'] as String? ?? 'other',
      storyAuthorId: data['storyAuthorId'] as String? ?? '',
      status: data['status'] as String? ?? 'pending',
      reportedAt: (data['reportedAt'] as Timestamp?)?.toDate(),
    );
  }
}

/// The current user's reactions on one story.
class UserReactions {
  final bool dua;
  final bool heart;
  const UserReactions({this.dua = false, this.heart = false});
}
