import 'package:flutter/material.dart';

class AppItem {
  final String name;
  final String category;
  final IconData icon;
  final Color iconColor;
  final Color iconBg;
  bool isBlocked;

  AppItem({
    required this.name,
    required this.category,
    required this.icon,
    required this.iconColor,
    required this.iconBg,
    this.isBlocked = false,
  });
}

List<AppItem> sampleApps = [
  // Social Media
  AppItem(
    name: 'Instagram',
    category: 'Social Media',
    icon: Icons.camera_alt_rounded,
    iconColor: const Color(0xFFE1306C),
    iconBg: const Color(0xFFFCE4EC),
    isBlocked: true,
  ),
  AppItem(
    name: 'TikTok',
    category: 'Social Media',
    icon: Icons.music_note_rounded,
    iconColor: const Color(0xFF010101),
    iconBg: const Color(0xFFF5F5F5),
    isBlocked: true,
  ),
  AppItem(
    name: 'Twitter / X',
    category: 'Social Media',
    icon: Icons.alternate_email_rounded,
    iconColor: const Color(0xFF1DA1F2),
    iconBg: const Color(0xFFE3F2FD),
    isBlocked: false,
  ),
  AppItem(
    name: 'Facebook',
    category: 'Social Media',
    icon: Icons.facebook_rounded,
    iconColor: const Color(0xFF1877F2),
    iconBg: const Color(0xFFE3F2FD),
    isBlocked: false,
  ),
  AppItem(
    name: 'Snapchat',
    category: 'Social Media',
    icon: Icons.photo_filter_rounded,
    iconColor: const Color(0xFFFFFC00),
    iconBg: const Color(0xFFFFFDE7),
    isBlocked: true,
  ),
  AppItem(
    name: 'Reddit',
    category: 'Social Media',
    icon: Icons.forum_rounded,
    iconColor: const Color(0xFFFF4500),
    iconBg: const Color(0xFFFFEBEE),
    isBlocked: false,
  ),
  // Entertainment
  AppItem(
    name: 'YouTube',
    category: 'Entertainment',
    icon: Icons.play_circle_filled_rounded,
    iconColor: const Color(0xFFFF0000),
    iconBg: const Color(0xFFFFEBEE),
    isBlocked: true,
  ),
  AppItem(
    name: 'Netflix',
    category: 'Entertainment',
    icon: Icons.movie_rounded,
    iconColor: const Color(0xFFE50914),
    iconBg: const Color(0xFFFFEBEE),
    isBlocked: false,
  ),
  AppItem(
    name: 'Twitch',
    category: 'Entertainment',
    icon: Icons.live_tv_rounded,
    iconColor: const Color(0xFF9146FF),
    iconBg: const Color(0xFFF3E5F5),
    isBlocked: false,
  ),
  AppItem(
    name: 'Spotify',
    category: 'Entertainment',
    icon: Icons.headphones_rounded,
    iconColor: const Color(0xFF1DB954),
    iconBg: const Color(0xFFE8F5E9),
    isBlocked: false,
  ),
  // Games
  AppItem(
    name: 'Mobile Games',
    category: 'Games',
    icon: Icons.sports_esports_rounded,
    iconColor: const Color(0xFF7B1FA2),
    iconBg: const Color(0xFFF3E5F5),
    isBlocked: true,
  ),
  AppItem(
    name: 'Chess',
    category: 'Games',
    icon: Icons.grid_on_rounded,
    iconColor: const Color(0xFF37474F),
    iconBg: const Color(0xFFECEFF1),
    isBlocked: false,
  ),
  // Messaging
  AppItem(
    name: 'WhatsApp',
    category: 'Messaging',
    icon: Icons.chat_bubble_rounded,
    iconColor: const Color(0xFF25D366),
    iconBg: const Color(0xFFE8F5E9),
    isBlocked: false,
  ),
  AppItem(
    name: 'Telegram',
    category: 'Messaging',
    icon: Icons.send_rounded,
    iconColor: const Color(0xFF0088CC),
    iconBg: const Color(0xFFE3F2FD),
    isBlocked: false,
  ),
  AppItem(
    name: 'Discord',
    category: 'Messaging',
    icon: Icons.tag_rounded,
    iconColor: const Color(0xFF5865F2),
    iconBg: const Color(0xFFEDE7F6),
    isBlocked: true,
  ),
];

Map<String, List<AppItem>> get appsByCategory {
  final Map<String, List<AppItem>> map = {};
  for (final app in sampleApps) {
    map.putIfAbsent(app.category, () => []).add(app);
  }
  return map;
}
