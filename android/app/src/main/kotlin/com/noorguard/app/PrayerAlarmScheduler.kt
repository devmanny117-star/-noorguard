package com.noorguard.app

import android.app.AlarmManager
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.os.Build
import android.util.Log
import org.json.JSONObject
import java.util.Calendar

/**
 * Shared native scheduling for the full-screen prayer alarms — a 7-day
 * pre-scheduled window of 35 alarms (ids 100–134: `100 + day*5 + prayer`,
 * day 0–6, prayer Fajr(0)–Isha(4)) — so all three entry points arm alarms
 * through the exact same code path:
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
 * [rescheduleStoredAlarms] replays it: still-future alarms as-is, already
 * past ones rolled forward in whole weeks to the same clock time — so the
 * armed window keeps covering the next 7 days. Prayer times drift only a few
 * minutes week to week, and the next app open replaces these with precisely
 * computed ones.
 */
object PrayerAlarmScheduler {
    private const val TAG = "PrayerAlarms"

    private const val STORE_NAME = "prayer_alarm_store"

    // Outside both the prayer-alarm id range (100–134) and the action-button
    // request-code ranges PrayerAlarmReceiver derives from them
    // (+200 → 300–334, +300 → 400–434).
    private const val MIDNIGHT_REQUEST_CODE = 190

    // The full 7-day window: id = 100 + day*5 + prayer (day 0–6,
    // Fajr(0)–Isha(4)). Day 0's ids are the original 100–104.
    val PRAYER_ALARM_IDS = 100..134

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
     * firing on time under Doze AND under Battery Saver: Android exempts
     * "alarm clock" alarms from both unconditionally (the same mechanism
     * alarm-clock apps rely on), and the status bar's alarm icon is
     * considered sufficient transparency to the user. It still requires the
     * exact-alarm permission on API 31+ though — [canScheduleExactAlarms]
     * guards that, and the setAlarmClock call itself is wrapped in a
     * try/catch, so a user who hasn't granted "Alarms & reminders" (or has
     * since revoked it) gets a skipped alarm instead of a crash.
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
        if (!canScheduleExactAlarms(alarmManager)) {
            Log.w(TAG, "scheduleAlarm: exact-alarm permission not granted, skipping id=$notifId ($prayerName)")
            return
        }
        try {
            alarmManager.setAlarmClock(
                AlarmManager.AlarmClockInfo(triggerAtMillis, showIntent), pi
            )
            Log.d(TAG, "Scheduled alarm id=$notifId ($prayerName) triggerAtMillis=$triggerAtMillis")
        } catch (e: SecurityException) {
            Log.w(TAG, "scheduleAlarm: SecurityException scheduling id=$notifId ($prayerName): $e")
        }
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
     * Re-arms the stored 7-day alarm window. Alarms whose stored moment is
     * still in the future (the normal case) are re-armed exactly as computed;
     * ones already past are rolled forward in whole weeks to the same clock
     * time on the same weekday, so the armed window always covers the next 7
     * days no matter how long the app goes unopened. Does nothing when the
     * master toggle is off.
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
                val weeks = weeksUntilFuture(o.getLong(KEY_EPOCH_MILLIS), now)
                val trigger = plusWeeks(o.getLong(KEY_EPOCH_MILLIS), weeks)
                if (trigger <= now) continue
                scheduleAlarm(
                    context,
                    prayerName = o.getString(KEY_PRAYER_NAME),
                    arabicName = o.optString(KEY_ARABIC_NAME),
                    prayerTime = o.optString(KEY_PRAYER_TIME),
                    message = o.optString(KEY_MESSAGE),
                    adhanId = o.optString(KEY_ADHAN_ID, "makkah"),
                    notifId = id,
                    allPrayersSerialized = shiftAllPrayers(o.optString(KEY_ALL_PRAYERS), weeks),
                    triggerAtMillis = trigger,
                )
                scheduled++
            } catch (e: Exception) {
                Log.w(TAG, "rescheduleStoredAlarms: stored alarm id=$id unreadable: $e")
            }
        }
        Log.d(TAG, "rescheduleStoredAlarms: re-armed $scheduled prayer alarm(s)")
    }

    /** Wipes every persisted alarm payload, so the midnight/boot receivers
     *  can't resurrect a schedule that was just cancelled (master toggle off)
     *  or is about to be replaced by a fresh Dart-side schedule. */
    fun clearStore(context: Context) {
        context.getSharedPreferences(STORE_NAME, Context.MODE_PRIVATE)
            .edit().clear().apply()
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
        if (!canScheduleExactAlarms(alarmManager)) {
            Log.w(TAG, "scheduleMidnightAlarm: exact-alarm permission not granted, skipping")
            return
        }
        try {
            alarmManager.setAlarmClock(AlarmManager.AlarmClockInfo(trigger, showIntent), pi)
            Log.d(TAG, "Scheduled midnight rescheduler for $trigger")
        } catch (e: SecurityException) {
            Log.w(TAG, "scheduleMidnightAlarm: SecurityException scheduling: $e")
        }
    }

    /**
     * True when it's safe to call setAlarmClock(): always on pre-S (the
     * permission didn't exist yet), otherwise only when the user has granted
     * "Alarms & reminders" — canScheduleExactAlarms() itself requires API 31.
     */
    private fun canScheduleExactAlarms(alarmManager: AlarmManager): Boolean {
        return Build.VERSION.SDK_INT < Build.VERSION_CODES.S || alarmManager.canScheduleExactAlarms()
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
     * Whole weeks to add to [epochMillis] so it lands in the future — 0 when
     * it already is. Calendar-based rather than adding weeks of milliseconds
     * so a DST shift between the stored day and the target day can't skew
     * the alarm's clock time by an hour.
     */
    private fun weeksUntilFuture(epochMillis: Long, now: Long): Int {
        var weeks = 0
        val cal = Calendar.getInstance().apply { timeInMillis = epochMillis }
        while (cal.timeInMillis <= now) {
            cal.add(Calendar.DAY_OF_YEAR, 7)
            weeks++
        }
        return weeks
    }

    /** [epochMillis] moved forward by [weeks] whole weeks, keeping the same
     *  local clock time across any DST change. */
    private fun plusWeeks(epochMillis: Long, weeks: Int): Long {
        if (weeks == 0) return epochMillis
        return Calendar.getInstance().apply {
            timeInMillis = epochMillis
            add(Calendar.DAY_OF_YEAR, 7 * weeks)
        }.timeInMillis
    }

    /**
     * Shifts every epoch in the "name,timeStr,millis;..." serialization
     * (see PrayerAlarmReceiver.EXTRA_ALL_PRAYERS) forward by [weeks] whole
     * weeks, so the lock-screen pills row a rolled-forward alarm shows
     * carries that day's times. Entries that don't parse pass through
     * unchanged.
     */
    private fun shiftAllPrayers(serialized: String, weeks: Int): String {
        if (serialized.isEmpty() || weeks == 0) return serialized
        return serialized.split(";").joinToString(";") { entry ->
            val parts = entry.split(",")
            val millis = if (parts.size >= 3) parts[2].toLongOrNull() else null
            if (millis == null) entry
            else "${parts[0]},${parts[1]},${plusWeeks(millis, weeks)}"
        }
    }
}
