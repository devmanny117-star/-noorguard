import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Text scale multipliers for the five steps: XS, S, M, L, XL.
/// L and XL go up to 4x normal size for low-vision accessibility.
const List<double> kFontScaleSteps = [0.85, 0.92, 1.0, 2.0, 4.0];

/// "M" (Medium / 1.0x) is the default step.
const int kDefaultFontScaleIndex = 2;

Future<int> loadFontScaleIndex(String screenKey) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getInt('font_scale_$screenKey') ?? kDefaultFontScaleIndex;
}

Future<void> saveFontScaleIndex(String screenKey, int index) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt('font_scale_$screenKey', index);
}

/// A slim "Aa" slider for adjusting the text size of a single screen.
/// Meant to sit just below the app bar on text-heavy reading screens.
class FontSizeSlider extends StatelessWidget {
  final int index;
  final ValueChanged<int> onChanged;

  const FontSizeSlider({super.key, required this.index, required this.onChanged});

  static const _gold = Color(0xFFD4AF37);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 6, 20, 2),
      child: Row(
        children: [
          Text(
            'A',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: _gold.withValues(alpha: 0.5),
            ),
          ),
          Expanded(
            child: SliderTheme(
              data: SliderThemeData(
                trackHeight: 2,
                activeTrackColor: _gold.withValues(alpha: 0.7),
                inactiveTrackColor: _gold.withValues(alpha: 0.15),
                thumbColor: _gold,
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
                overlayShape: const RoundSliderOverlayShape(overlayRadius: 14),
                tickMarkShape: SliderTickMarkShape.noTickMark,
              ),
              child: Slider(
                value: index.toDouble(),
                min: 0,
                max: (kFontScaleSteps.length - 1).toDouble(),
                divisions: kFontScaleSteps.length - 1,
                onChanged: (v) => onChanged(v.round()),
              ),
            ),
          ),
          Text(
            'A',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: _gold.withValues(alpha: 0.9),
            ),
          ),
        ],
      ),
    );
  }
}
