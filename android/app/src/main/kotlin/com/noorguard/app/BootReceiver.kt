package com.noorguard.app

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.util.Log

/**
 * After a reboot: restarts the prayer keep-alive foreground service (if it
 * was running before), and — Layer 3 of prayer-alarm reliability — re-arms
 * the day's remaining full-screen prayer alarms plus the nightly 12:01am
 * rescheduler, since a restart wipes every AlarmManager entry. Alarm
 * restoration is skipped entirely when the master notification toggle is
 * off (restartIfEnabled performs its own equivalent check internally).
 */
class BootReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        when (intent.action) {
            Intent.ACTION_BOOT_COMPLETED,
            "android.intent.action.QUICKBOOT_POWERON",
            "com.htc.intent.action.QUICKBOOT_POWERON" -> {
                PrayerForegroundService.restartIfEnabled(context)
                if (PrayerAlarmScheduler.notificationsMasterEnabled(context)) {
                    Log.d("PrayerAlarms", "BootReceiver: restoring prayer alarms after reboot")
                    PrayerAlarmScheduler.rescheduleStoredAlarms(context)
                    PrayerAlarmScheduler.scheduleMidnightAlarm(context)
                } else {
                    Log.d("PrayerAlarms", "BootReceiver: notif_master is false, not restoring alarms")
                }
            }
        }
    }
}
