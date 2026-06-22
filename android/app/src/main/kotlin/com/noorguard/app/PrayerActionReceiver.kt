package com.noorguard.app

import android.app.NotificationManager
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent

/** Handles the "I Prayed" and "Dismiss" action buttons on the alarm notification. */
class PrayerActionReceiver : BroadcastReceiver() {

    companion object {
        const val ACTION_PRAYED = "com.noorguard.app.ACTION_PRAYED"
        const val ACTION_DISMISS = "com.noorguard.app.ACTION_DISMISS"
    }

    override fun onReceive(context: Context, intent: Intent) {
        val notifId = intent.getIntExtra(
            PrayerAlarmReceiver.EXTRA_NOTIFICATION_ID, 100
        )
        val notifManager =
            context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
        notifManager.cancel(notifId)

        if (intent.action == ACTION_PRAYED) {
            val prayerName = intent.getStringExtra(
                PrayerAlarmReceiver.EXTRA_PRAYER_NAME
            ) ?: return
            val prefs = context.getSharedPreferences(
                "prayer_alarm_marks", Context.MODE_PRIVATE
            )
            val today = java.text.SimpleDateFormat("yyyy-MM-dd", java.util.Locale.US)
                .format(java.util.Date())
            val existing = prefs.getStringSet("marked_$today", mutableSetOf())
                ?: mutableSetOf()
            val updated = existing.toMutableSet()
            updated.add(prayerName)
            prefs.edit().putStringSet("marked_$today", updated).apply()
        }
    }
}
