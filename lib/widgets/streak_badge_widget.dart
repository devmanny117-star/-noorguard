import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/streak_calendar_screen.dart';
import '../services/streak_service.dart';

class StreakBadgeWidget extends StatefulWidget {
  const StreakBadgeWidget({super.key});

  @override
  State<StreakBadgeWidget> createState() => _StreakBadgeWidgetState();
}

class _StreakBadgeWidgetState extends State<StreakBadgeWidget> {
  static const _gold = Color(0xFFD4AF37);
  static const _navy = Color(0xFF0D1B2A);

  int _streak = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _loadStreak();
    _timer = Timer.periodic(const Duration(seconds: 3), (_) => _loadStreak());
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Future<void> _loadStreak() async {
    final count = await StreakService().getStreak();
    if (mounted) setState(() => _streak = count);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const StreakCalendarScreen()),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
        decoration: BoxDecoration(
          color: _navy,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: _gold.withOpacity(0.5), width: 1.5),
          boxShadow: [
            BoxShadow(
              color: _gold.withOpacity(0.18),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('🔥', style: TextStyle(fontSize: 15)),
            const SizedBox(width: 6),
            Text(
              '$_streak',
              style: GoogleFonts.playfairDisplay(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: _gold,
                height: 1.1,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              _streak == 1 ? 'day' : 'days',
              style: GoogleFonts.lato(
                fontSize: 12,
                color: _gold.withOpacity(0.7),
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
