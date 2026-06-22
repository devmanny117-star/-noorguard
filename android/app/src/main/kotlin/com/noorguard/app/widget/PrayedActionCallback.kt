package com.noorguard.app.widget

import android.content.Context
import androidx.glance.GlanceId
import androidx.glance.action.ActionParameters
import androidx.glance.appwidget.action.ActionCallback
import androidx.glance.appwidget.updateAll
import es.antonborri.home_widget.HomeWidgetPlugin
import org.json.JSONArray
import java.text.SimpleDateFormat
import java.util.Locale

/**
 * Marks the most recently-due, not-yet-completed prayer as done when the
 * widget's "I Prayed" button is tapped.
 *
 * Writes to two places:
 * 1. The `prayer_alarm_marks` SharedPreferences file — the same store
 *    PrayerActionReceiver.kt already writes to for the notification's "I
 *    Prayed" action — so the next time the app opens, its existing
 *    getPendingPrayerMarks() flow reconciles this into the authoritative
 *    StreakService record (single source of truth, no separate one invented
 *    here).
 * 2. The home_widget SharedPreferences `prayers_json` entry directly, purely
 *    so the widget itself reflects the change instantly without waiting for
 *    the app to be opened and push a fresh snapshot.
 */
class PrayedActionCallback : ActionCallback {
    override suspend fun onAction(
        context: Context,
        glanceId: GlanceId,
        parameters: ActionParameters,
    ) {
        val prefs = HomeWidgetPlugin.getData(context)
        val prayersJson = prefs.getString("prayers_json", null) ?: return
        val arr = JSONArray(prayersJson)

        var nextIndex = -1
        for (i in 0 until arr.length()) {
            if (arr.getJSONObject(i).getBoolean("isNext")) {
                nextIndex = i
                break
            }
        }
        if (nextIndex == -1) return
        val currentIndex = (nextIndex - 1 + arr.length()) % arr.length()
        val current = arr.getJSONObject(currentIndex)
        if (current.getBoolean("done")) return // already marked

        current.put("done", true)
        prefs.edit().putString("prayers_json", arr.toString()).apply()

        val englishName = current.getString("name")
        markPendingForReconciliation(context, englishName)

        SmallPrayerWidget().updateAll(context)
        MediumPrayerWidget().updateAll(context)
        LargePrayerWidget().updateAll(context)
    }

    private fun markPendingForReconciliation(context: Context, prayerName: String) {
        val prefs = context.getSharedPreferences("prayer_alarm_marks", Context.MODE_PRIVATE)
        val today = SimpleDateFormat("yyyy-MM-dd", Locale.US).format(java.util.Date())
        val existing = prefs.getStringSet("marked_$today", mutableSetOf()) ?: mutableSetOf()
        val updated = existing.toMutableSet()
        updated.add(prayerName)
        prefs.edit().putStringSet("marked_$today", updated).apply()
    }
}
