package com.noorguard.app

import android.app.AlarmManager
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.util.Log
import org.json.JSONObject
import java.util.Calendar

/**
 * Shared native scheduling for the full-screen prayer alarms (ids 100–104),
 * so all three entry points arm alarms through the exact same code path:
 *
 *   1. Dart → MainActivity's "schedulePrayerAlarm" MethodChannel call (the
 *      app is open; times come fresh from the device location).
 *   2. [MidnightSchedulerReceiver] at 12:01am (Layer 2 — the app may never
 *      have been opened today).
 *   3. [BootReceiver] after a restart (Layer 3 — a reboot wipes every
 *      AlarmManager entry).
 *
 * Entry points 2 and 3 run without Flutter, so they can't recompute prayer
 * times. Instead, every Dart-side schedule persists its full alarm payload
 * (localized strings, adhan id, epoch time) into [STORE_NAME], and
 * [rescheduleStoredAlarms] replays it re-anchored to the current day's date
 * at the same clock time. Prayer times drift only a minute or two per day,
 * and the next app open replaces these with precisely computed ones.
 */
object PrayerAlarmScheduler {
    private const val TAG = "PrayerAlarms"

    private const val STORE_NAME = "prayer_alarm_store"

    // Outside both the prayer-alarm id range (100–104) and the action-button
    // request-code ranges PrayerAlarmReceiver derives from them (+200/+300).
    private const val MIDNIGHT_REQUEST_CODE = 190

    private val PRAYER_ALARM_IDS = 100..104

    private const val KEY_PRAYER_NAME = "prayerName"
    private const val KEY_ARABIC_NAME = "arabicName"
    private const val KEY_PRAYER_TIME = "prayerTime"
    private const val KEY_MESSAGE = "message"
    private const val KEY_ADHAN_ID = "adhanId"
    private const val KEY_EPOCH_MILLIS = "epochMillis"
    private const val KEY_ALL_PRAYERS = "allPrayers"

    /**
     * True only when the user's Dart-side Prayer Notifications master toggle
     * is on (Dart's prefs live in "FlutterSharedPreferences" with a
     * "flutter." key prefix). Mirrors the same check in MainActivity,
     * PrayerForegroundService, and PrayerAlarmReceiver.
     */
    fun notificationsMasterEnabled(context: Context): Boolean {
        val dartPrefs =
            context.getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE)
        return dartPrefs.getBoolean("flutter.notif_master", true)
    }

    /**
     * Arms one full-screen prayer alarm. Moved verbatim from MainActivity so
     * the midnight/boot receivers schedule through the identical mechanism.
     *
     * setAlarmClock() — not setExactAndAllowWhileIdle() — is what keeps this
     * firing on time under Doze AND under Battery Saver, without asking the
     * user to turn Battery Saver off or grant anything: Android exempts
     * "alarm clock" alarms from both unconditionally (the same mechanism
     * alarm-clock apps rely on), and unlike setExact/setExactAndAllowWhileIdle
     * it needs no SCHEDULE_EXACT_ALARM permission at all — the status bar's
     * alarm icon is considered sufficient transparency to the user. Tapping
     * that icon opens the app via showIntent.
     */
    fun scheduleAlarm(
        context: Context,
        prayerName: String,
        arabicName: String,
        prayerTime: String,
        message: String,
        adhanId: String,
        notifId: Int,
        allPrayersSerialized: String,
        triggerAtMillis: Long,
    ) {
        val alarmManager = context.getSystemService(Context.ALARM_SERVICE) as AlarmManager
        val intent = Intent(context, PrayerAlarmReceiver::class.java).apply {
            putExtra(PrayerAlarmReceiver.EXTRA_PRAYER_NAME, prayerName)
            putExtra(PrayerAlarmReceiver.EXTRA_PRAYER_ARABIC, arabicName)
            putExtra(PrayerAlarmReceiver.EXTRA_PRAYER_TIME, prayerTime)
            putExtra(PrayerAlarmReceiver.EXTRA_PRAYER_MESSAGE, message)
            putExtra(PrayerAlarmReceiver.EXTRA_ADHAN_ID, adhanId)
            putExtra(PrayerAlarmReceiver.EXTRA_NOTIFICATION_ID, notifId)
            putExtra(PrayerAlarmReceiver.EXTRA_ALL_PRAYERS, allPrayersSerialized)
        }
        val pi = PendingIntent.getBroadcast(
            context, notifId, intent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )
        val showIntent = PendingIntent.getActivity(
            context, notifId, Intent(context, MainActivity::class.java),
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )
        alarmManager.setAlarmClock(
            AlarmManager.AlarmClockInfo(triggerAtMillis, showIntent), pi
        )
        Log.d(TAG, "Scheduled alarm id=$notifId ($prayerName) triggerAtMillis=$triggerAtMillis")
    }

    /**
     * Saves one alarm's full payload so [rescheduleStoredAlarms] can replay
     * it on a later day without Flutter running. Called on every Dart-side
     * schedule, so the store always reflects the latest language, adhan
     * style, and prayer times.
     */
    fun persistAlarm(
        context: Context,
        prayerName: String,
        arabicName: String,
        prayerTime: String,
        message: String,
        adhanId: String,
        notifId: Int,
        allPrayersSerialized: String,
        triggerAtMillis: Long,
    ) {
        val json = JSONObject()
            .put(KEY_PRAYER_NAME, prayerName)
            .put(KEY_ARABIC_NAME, arabicName)
            .put(KEY_PRAYER_TIME, prayerTime)
            .put(KEY_MESSAGE, message)
            .put(KEY_ADHAN_ID, adhanId)
            .put(KEY_EPOCH_MILLIS, triggerAtMillis)
            .put(KEY_ALL_PRAYERS, allPrayersSerialized)
        context.getSharedPreferences(STORE_NAME, Context.MODE_PRIVATE).edit()
            .putString("alarm_$notifId", json.toString())
            .apply()
    }

    /**
     * Re-arms every stored prayer alarm at the same clock time on the current
     * day, skipping ones already in the past (a boot at 3pm only restores the
     * remaining prayers). Does nothing when the master toggle is off.
     */
    fun rescheduleStoredAlarms(context: Context) {
        if (!notificationsMasterEnabled(context)) {
            Log.d(TAG, "rescheduleStoredAlarms: notif_master is false, doing nothing")
            return
        }
        val store = context.getSharedPreferences(STORE_NAME, Context.MODE_PRIVATE)
        val now = System.currentTimeMillis()
        var scheduled = 0
        for (id in PRAYER_ALARM_IDS) {
            val raw = store.getString("alarm_$id", null) ?: continue
            try {
                val o = JSONObject(raw)
                val trigger = todayAtSameClockTime(o.getLong(KEY_EPOCH_MILLIS), now)
                if (trigger <= now) continue
                scheduleAlarm(
                    context,
                    prayerName = o.getString(KEY_PRAYER_NAME),
                    arabicName = o.optString(KEY_ARABIC_NAME),
                    prayerTime = o.optString(KEY_PRAYER_TIME),
                    message = o.optString(KEY_MESSAGE),
                    adhanId = o.optString(KEY_ADHAN_ID, "makkah"),
                    notifId = id,
                    allPrayersSerialized = reanchorAllPrayers(o.optString(KEY_ALL_PRAYERS), now),
                    triggerAtMillis = trigger,
                )
                scheduled++
            } catch (e: Exception) {
                Log.w(TAG, "rescheduleStoredAlarms: stored alarm id=$id unreadable: $e")
            }
        }
        Log.d(TAG, "rescheduleStoredAlarms: re-armed $scheduled prayer alarm(s)")
    }

    /**
     * Arms (or re-arms — same request code, so it replaces itself) the
     * 12:01am [MidnightSchedulerReceiver] alarm for the coming midnight.
     * setAlarmClock for the same Doze/Battery-Saver exemption reasons as the
     * prayer alarms: a midnight refresh that Doze defers until morning would
     * silently swallow Fajr.
     */
    fun scheduleMidnightAlarm(context: Context) {
        val alarmManager = context.getSystemService(Context.ALARM_SERVICE) as AlarmManager
        val trigger = Calendar.getInstance().apply {
            set(Calendar.HOUR_OF_DAY, 0)
            set(Calendar.MINUTE, 1)
            set(Calendar.SECOND, 0)
            set(Calendar.MILLISECOND, 0)
            if (timeInMillis <= System.currentTimeMillis()) add(Calendar.DAY_OF_YEAR, 1)
        }.timeInMillis
        val pi = PendingIntent.getBroadcast(
            context, MIDNIGHT_REQUEST_CODE,
            Intent(context, MidnightSchedulerReceiver::class.java),
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )
        val showIntent = PendingIntent.getActivity(
            context, MIDNIGHT_REQUEST_CODE, Intent(context, MainActivity::class.java),
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )
        alarmManager.setAlarmClock(AlarmManager.AlarmClockInfo(trigger, showIntent), pi)
        Log.d(TAG, "Scheduled midnight rescheduler for $trigger")
    }

    /** Cancels the nightly 12:01am rescheduler (used when the user turns the
     *  master toggle off, so no orphaned alarm-clock icon lingers). */
    fun cancelMidnightAlarm(context: Context) {
        val pi = PendingIntent.getBroadcast(
            context, MIDNIGHT_REQUEST_CODE,
            Intent(context, MidnightSchedulerReceiver::class.java),
            PendingIntent.FLAG_NO_CREATE or PendingIntent.FLAG_IMMUTABLE
        ) ?: return
        val alarmManager = context.getSystemService(Context.ALARM_SERVICE) as AlarmManager
        alarmManager.cancel(pi)
        pi.cancel()
        Log.d(TAG, "Cancelled midnight rescheduler")
    }

    /**
     * The stored moment's clock time (hour/minute/second) transplanted onto
     * the current day. Calendar-based rather than adding whole days of
     * milliseconds so a DST shift between the stored day and today can't
     * skew every alarm by an hour.
     */
    private fun todayAtSameClockTime(epochMillis: Long, now: Long): Long {
        val src = Calendar.getInstance().apply { timeInMillis = epochMillis }
        return Calendar.getInstance().apply {
            timeInMillis = now
            set(Calendar.HOUR_OF_DAY, src.get(Calendar.HOUR_OF_DAY))
            set(Calendar.MINUTE, src.get(Calendar.MINUTE))
            set(Calendar.SECOND, src.get(Calendar.SECOND))
            set(Calendar.MILLISECOND, 0)
        }.timeInMillis
    }

    /**
     * Re-anchors every epoch in the "name,timeStr,millis;..." serialization
     * (see PrayerAlarmReceiver.EXTRA_ALL_PRAYERS) to the current day, so the
     * lock-screen pills row a replayed alarm shows carries today's times.
     * Entries that don't parse pass through unchanged.
     */
    private fun reanchorAllPrayers(serialized: String, now: Long): String {
        if (serialized.isEmpty()) return serialized
        return serialized.split(";").joinToString(";") { entry ->
            val parts = entry.split(",")
            val millis = if (parts.size >= 3) parts[2].toLongOrNull() else null
            if (millis == null) entry
            else "${parts[0]},${parts[1]},${todayAtSameClockTime(millis, now)}"
        }
    }
}
