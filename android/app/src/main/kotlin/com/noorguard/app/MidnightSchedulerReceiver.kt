package com.noorguard.app

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.util.Log

/**
 * Layer 2 of prayer-alarm reliability: fires at 12:01am every night (armed
 * with setAlarmClock, so Doze and Battery Saver can't defer it) and re-arms
 * the 7-day full-screen prayer-alarm window from the natively persisted
 * payloads (rolling any already-past day forward a week) — covering users
 * who never open the app, where the Dart-side day-change rescheduling in
 * the home screen never gets a chance to run.
 *
 * Re-arms itself for the next midnight after each firing so the chain
 * repeats nightly. When the master toggle is off it does nothing — including
 * not rescheduling itself; the chain is restarted by the next Dart-side
 * schedule (re-enabling the toggle or any app open re-arms it via
 * MainActivity's schedulePrayerAlarm).
 */
class MidnightSchedulerReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        if (!PrayerAlarmScheduler.notificationsMasterEnabled(context)) {
            Log.d("PrayerAlarms", "MidnightSchedulerReceiver: notif_master is false, doing nothing")
            return
        }
        Log.d("PrayerAlarms", "MidnightSchedulerReceiver: re-arming today's prayer alarms")
        PrayerAlarmScheduler.rescheduleStoredAlarms(context)
        PrayerAlarmScheduler.scheduleMidnightAlarm(context)
    }
}
