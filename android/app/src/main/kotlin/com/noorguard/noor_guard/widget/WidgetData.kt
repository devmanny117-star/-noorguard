package com.noorguard.noor_guard.widget

import android.content.SharedPreferences
import org.json.JSONArray

/** One prayer entry as pushed by WidgetDataService (lib/services/widget_data_service.dart). */
data class WidgetPrayer(
    val name: String,
    val displayName: String,
    val time: String,
    val done: Boolean,
    val isNext: Boolean,
)

/** Snapshot of everything the widgets need, read from the `home_widget` SharedPreferences
 * file (written from Dart via HomeWidget.saveWidgetData — see widget_data_service.dart). */
data class WidgetData(
    val nextPrayerName: String,
    val nextPrayerTime: String,
    val nextPrayerEpochMillis: Long?,
    val prayers: List<WidgetPrayer>,
    val streakCount: Int,
    val hijriDate: String,
    val locationLabel: String,
    val qiblaBearingDegrees: Double?,
    val dailyVerseText: String,
    val dailyVerseRef: String,
    val isRtl: Boolean,
    val labelNextPrayer: String,
    val labelIPrayed: String,
    val labelStreak: String,
    val labelDayStreak: String,
    val labelQibla: String,
) {
    companion object {
        private const val DOUBLE_MARKER_PREFIX = "home_widget.double."

        fun from(prefs: SharedPreferences): WidgetData {
            val prayersJson = prefs.getString("prayers_json", null)
            val prayers = mutableListOf<WidgetPrayer>()
            if (prayersJson != null) {
                try {
                    val arr = JSONArray(prayersJson)
                    for (i in 0 until arr.length()) {
                        val o = arr.getJSONObject(i)
                        prayers.add(
                            WidgetPrayer(
                                name = o.getString("name"),
                                displayName = o.getString("displayName"),
                                time = o.getString("time"),
                                done = o.getBoolean("done"),
                                isNext = o.getBoolean("isNext"),
                            )
                        )
                    }
                } catch (_: Exception) {
                    // Leave prayers empty if the JSON is malformed/missing.
                }
            }

            val epochMillis = prefs.getLong("next_prayer_epoch_millis", -1L)
            return WidgetData(
                nextPrayerName = prefs.getString("next_prayer_name", "") ?: "",
                nextPrayerTime = prefs.getString("next_prayer_time", "") ?: "",
                nextPrayerEpochMillis = if (epochMillis > 0) epochMillis else null,
                prayers = prayers,
                streakCount = prefs.getInt("streak_count", 0),
                hijriDate = prefs.getString("hijri_date", "") ?: "",
                locationLabel = prefs.getString("location_label", "") ?: "",
                qiblaBearingDegrees = getDouble(prefs, "qibla_bearing_degrees"),
                dailyVerseText = prefs.getString("daily_verse_text", "") ?: "",
                dailyVerseRef = prefs.getString("daily_verse_ref", "") ?: "",
                isRtl = prefs.getBoolean("is_rtl", false),
                labelNextPrayer = prefs.getString("label_next_prayer", "Next Prayer") ?: "Next Prayer",
                labelIPrayed = prefs.getString("label_i_prayed", "I Prayed") ?: "I Prayed",
                labelStreak = prefs.getString("label_streak", "Streak") ?: "Streak",
                labelDayStreak = prefs.getString("label_day_streak", "day streak") ?: "day streak",
                labelQibla = prefs.getString("label_qibla", "Qibla") ?: "Qibla",
            )
        }

        /** Decodes a Double saved by home_widget, which stores it as raw long bits
         * alongside a "$DOUBLE_MARKER_PREFIX$key" boolean marker. */
        private fun getDouble(prefs: SharedPreferences, key: String): Double? {
            if (!prefs.contains(key)) return null
            return try {
                if (prefs.getBoolean("$DOUBLE_MARKER_PREFIX$key", false)) {
                    Double.fromBits(prefs.getLong(key, 0L))
                } else {
                    prefs.getFloat(key, 0f).toDouble()
                }
            } catch (_: Exception) {
                null
            }
        }
    }

    /** "2h 15m" / "45m" style countdown, computed at render time (from the
     * AppWidget's periodic update) so it stays accurate without a live timer. */
    fun countdownLabel(): String {
        val target = nextPrayerEpochMillis ?: return ""
        val diff = target - System.currentTimeMillis()
        if (diff <= 0) return ""
        val totalMinutes = diff / 60000
        val hours = totalMinutes / 60
        val minutes = totalMinutes % 60
        return if (hours > 0) "${hours}h ${minutes}m" else "${minutes}m"
    }
}

