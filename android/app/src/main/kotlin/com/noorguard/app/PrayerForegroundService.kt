package com.noorguard.app

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.app.Service
import android.content.Context
import android.content.Intent
import android.content.pm.ServiceInfo
import android.graphics.Typeface
import android.os.Build
import android.os.Handler
import android.os.IBinder
import android.os.Looper
import android.text.SpannableStringBuilder
import android.text.Spanned
import android.text.style.ForegroundColorSpan
import android.text.style.StyleSpan
import android.util.Log
import androidx.core.app.NotificationCompat
import androidx.core.content.ContextCompat
import org.json.JSONObject
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale

/**
 * Foreground service with two jobs:
 *
 * 1. Keep the app process classified as "foreground" by Android, so
 *    prayer-time `AlarmManager` broadcasts and their notifications keep being
 *    delivered when the OS would otherwise treat the process as
 *    idle/background and defer or drop them.
 *
 * 2. Render the persistent **Noor Guard Live** notification the
 *    foreground-service contract requires anyway: next prayer + time in the
 *    title, a countdown underneath, and — expanded — a rotating daily piece
 *    of Islamic content (ayah / dua / glossary word / Name of Allah / hadith)
 *    below a gold divider. Shown on the lock screen, silent, can't be
 *    swiped away, and refreshes itself every 30 minutes (or sooner, at the
 *    next prayer-time boundary).
 *
 * All user-visible text arrives already localized: the fallback
 * title/text/channel strings via the start Intent, and the rich payload via
 * the `flutter.live_notif_payload` JSON that Dart's LiveNotificationService
 * writes into FlutterSharedPreferences (countdown strings come as templates
 * with literal `{h}`/`{m}` placeholders, and the rotating content covers the
 * next 7 days keyed by date so it stays fresh without the app opening).
 */
class PrayerForegroundService : Service() {

    companion object {
        private const val CHANNEL_ID = "noor_guard_live"

        // Channel from before the keep-alive notification became the rich
        // live notification. Deleted on every start so users don't see a
        // stale, duplicate entry in system notification settings. Safe to
        // delete (unlike the Samsung-sensitive alarm channels): it was
        // silent + IMPORTANCE_LOW, so it has no OEM toggle worth preserving.
        private const val LEGACY_CHANNEL_ID = "prayer_keep_alive"

        private const val NOTIFICATION_ID = 9001

        private const val UPDATE_INTERVAL_MS = 30L * 60L * 1000L
        private const val MIN_UPDATE_DELAY_MS = 60L * 1000L
        private const val DAY_MS = 24L * 60L * 60L * 1000L

        private const val PAYLOAD_PREFS_KEY = "flutter.live_notif_payload"

        private const val GOLD = 0xFFC9A84C.toInt()
        private const val DIVIDER = "━━━━━━━━━━━━"

        private const val EXTRA_TITLE = "title"
        private const val EXTRA_TEXT = "text"
        private const val EXTRA_CHANNEL_NAME = "channelName"
        private const val EXTRA_CHANNEL_DESCRIPTION = "channelDescription"

        private const val PREFS_NAME = "prayer_keep_alive_prefs"
        private const val KEY_ENABLED = "enabled"
        private const val KEY_TITLE = "title"
        private const val KEY_TEXT = "text"
        private const val KEY_CHANNEL_NAME = "channel_name"
        private const val KEY_CHANNEL_DESCRIPTION = "channel_description"

        fun start(
            context: Context,
            title: String,
            text: String,
            channelName: String,
            channelDescription: String,
        ) {
            context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE).edit()
                .putBoolean(KEY_ENABLED, true)
                .putString(KEY_TITLE, title)
                .putString(KEY_TEXT, text)
                .putString(KEY_CHANNEL_NAME, channelName)
                .putString(KEY_CHANNEL_DESCRIPTION, channelDescription)
                .apply()
            ContextCompat.startForegroundService(
                context,
                buildIntent(context, title, text, channelName, channelDescription)
            )
        }

        fun stop(context: Context) {
            context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE).edit()
                .putBoolean(KEY_ENABLED, false)
                .apply()
            context.stopService(Intent(context, PrayerForegroundService::class.java))
        }

        /**
         * Restarts the service after a reboot using the last known (already
         * localized) text, but only if it was actually running before — never
         * starts it for users who don't have prayer notifications enabled.
         */
        fun restartIfEnabled(context: Context) {
            val prefs = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
            if (!prefs.getBoolean(KEY_ENABLED, false)) {
                Log.d("PrayerAlarms", "restartIfEnabled: keep-alive service was not running, skipping")
                return
            }

            // Cross-check the Dart-side master toggle too. This service's own
            // KEY_ENABLED flag is only updated by start()/stop(), so it can
            // only drift from the user's actual notif_master preference if
            // those calls are ever skipped — but a reboot is exactly the kind
            // of edge case worth defending regardless: never resurrect this
            // foreground notification for a user who has prayer notifications
            // off. The shared_preferences plugin stores Dart's prefs in a
            // separate "FlutterSharedPreferences" file with a "flutter." key
            // prefix.
            val dartPrefs = context.getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE)
            if (!dartPrefs.getBoolean("flutter.notif_master", true)) {
                Log.d("PrayerAlarms", "restartIfEnabled: notif_master is false, not restarting keep-alive service")
                return
            }

            Log.d("PrayerAlarms", "restartIfEnabled: restarting keep-alive service after reboot")
            val title = prefs.getString(KEY_TITLE, "Noor Guard") ?: "Noor Guard"
            val text = prefs.getString(KEY_TEXT, "Prayer notifications active")
                ?: "Prayer notifications active"
            val channelName = prefs.getString(KEY_CHANNEL_NAME, "Noor Guard Live")
                ?: "Noor Guard Live"
            val channelDescription = prefs.getString(KEY_CHANNEL_DESCRIPTION, "") ?: ""
            ContextCompat.startForegroundService(
                context,
                buildIntent(context, title, text, channelName, channelDescription)
            )
        }

        private fun buildIntent(
            context: Context,
            title: String,
            text: String,
            channelName: String,
            channelDescription: String,
        ) = Intent(context, PrayerForegroundService::class.java).apply {
            putExtra(EXTRA_TITLE, title)
            putExtra(EXTRA_TEXT, text)
            putExtra(EXTRA_CHANNEL_NAME, channelName)
            putExtra(EXTRA_CHANNEL_DESCRIPTION, channelDescription)
        }
    }

    private var fallbackTitle = "Noor Guard"
    private var fallbackText = "Prayer notifications active"

    private val handler = Handler(Looper.getMainLooper())
    private val updateRunnable = object : Runnable {
        override fun run() {
            val notifManager = getSystemService(NOTIFICATION_SERVICE) as NotificationManager
            notifManager.notify(NOTIFICATION_ID, buildNotification())
            scheduleNextUpdate()
        }
    }

    override fun onBind(intent: Intent?): IBinder? = null

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        fallbackTitle = intent?.getStringExtra(EXTRA_TITLE) ?: fallbackTitle
        fallbackText = intent?.getStringExtra(EXTRA_TEXT) ?: fallbackText
        val channelName = intent?.getStringExtra(EXTRA_CHANNEL_NAME) ?: "Noor Guard Live"
        val channelDescription = intent?.getStringExtra(EXTRA_CHANNEL_DESCRIPTION) ?: ""

        ensureChannel(channelName, channelDescription)

        val notification = buildNotification()
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE) {
            startForeground(NOTIFICATION_ID, notification, ServiceInfo.FOREGROUND_SERVICE_TYPE_SPECIAL_USE)
        } else {
            startForeground(NOTIFICATION_ID, notification)
        }

        scheduleNextUpdate()
        return START_STICKY
    }

    override fun onDestroy() {
        handler.removeCallbacks(updateRunnable)
        super.onDestroy()
    }

    /**
     * Refresh every 30 minutes, but never sleep through a prayer-time
     * boundary — when the next prayer arrives sooner, wake just after it so
     * the title rolls over to the following prayer on time.
     */
    private fun scheduleNextUpdate() {
        handler.removeCallbacks(updateRunnable)
        var delay = UPDATE_INTERVAL_MS
        val payload = readPayload()
        if (payload != null) {
            val now = System.currentTimeMillis()
            nextPrayer(payload, now)?.let { next ->
                val untilBoundary = next.epochMillis - now + 5_000L
                if (untilBoundary < delay) delay = untilBoundary
            }
        }
        handler.postDelayed(updateRunnable, delay.coerceAtLeast(MIN_UPDATE_DELAY_MS))
    }

    private fun buildNotification(): Notification {
        val openAppIntent = packageManager.getLaunchIntentForPackage(packageName)
        val contentPi = openAppIntent?.let {
            PendingIntent.getActivity(
                this, 0, it,
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
            )
        }

        val builder = NotificationCompat.Builder(this, CHANNEL_ID)
            .setSmallIcon(R.drawable.ic_notif_crescent)
            .setColor(GOLD)
            .setPriority(NotificationCompat.PRIORITY_LOW)
            .setVisibility(NotificationCompat.VISIBILITY_PUBLIC)
            .setOngoing(true)
            .setOnlyAlertOnce(true)
            .setShowWhen(false)
            .setContentIntent(contentPi)

        val payload = readPayload()
        val now = System.currentTimeMillis()
        val next = payload?.let { nextPrayer(it, now) }
        if (payload == null || next == null) {
            // No payload yet (service started before the home screen's first
            // prayer-time resolution) — plain keep-alive notification.
            return builder
                .setContentTitle(fallbackTitle)
                .setContentText(fallbackText)
                .build()
        }

        val countdown = countdownText(payload, next.epochMillis - now)
        builder
            .setContentTitle("${next.displayName} • ${next.timeLabel}")
            .setContentText(countdown)

        contentForToday(payload)?.let { content ->
            val big = SpannableStringBuilder()
            big.append(countdown).append('\n')
            appendSpanned(big, DIVIDER, ForegroundColorSpan(GOLD))
            big.append('\n')
            val header = content.optString("header")
            if (header.isNotEmpty()) {
                appendSpanned(big, header, ForegroundColorSpan(GOLD), StyleSpan(Typeface.BOLD))
                big.append('\n')
            }
            val arabic = content.optString("arabic")
            if (arabic.isNotEmpty()) big.append(arabic).append('\n')
            val body = content.optString("body")
            if (body.isNotEmpty()) big.append(body).append('\n')
            val source = content.optString("source")
            if (source.isNotEmpty()) big.append(source)
            builder.setStyle(NotificationCompat.BigTextStyle().bigText(big.trimEnd()))
        }

        return builder.build()
    }

    private fun appendSpanned(
        sb: SpannableStringBuilder,
        text: String,
        vararg spans: Any,
    ) {
        val start = sb.length
        sb.append(text)
        for (span in spans) {
            sb.setSpan(span, start, sb.length, Spanned.SPAN_EXCLUSIVE_EXCLUSIVE)
        }
    }

    private fun readPayload(): JSONObject? {
        val raw = getSharedPreferences("FlutterSharedPreferences", Context.MODE_PRIVATE)
            .getString(PAYLOAD_PREFS_KEY, null) ?: return null
        return try {
            JSONObject(raw)
        } catch (e: Exception) {
            Log.w("PrayerAlarms", "live notification payload unreadable: $e")
            null
        }
    }

    private data class NextPrayer(
        val displayName: String,
        val timeLabel: String,
        val epochMillis: Long,
    )

    /**
     * First of today's prayers still in the future; after Isha, rolls to the
     * payload's (approximate) tomorrow-Fajr, advancing in whole days if the
     * payload is more than a day stale so the countdown never goes negative.
     */
    private fun nextPrayer(payload: JSONObject, now: Long): NextPrayer? {
        val prayers = payload.optJSONArray("prayers")
        if (prayers != null) {
            for (i in 0 until prayers.length()) {
                val p = prayers.optJSONObject(i) ?: continue
                val t = p.optLong("epochMillis")
                if (t > now) {
                    return NextPrayer(p.optString("displayName"), p.optString("timeLabel"), t)
                }
            }
        }
        var fajr = payload.optLong("tomorrowFajrEpochMillis")
        if (fajr <= 0L) return null
        while (fajr <= now) fajr += DAY_MS
        return NextPrayer(
            payload.optString("tomorrowFajrDisplayName"),
            payload.optString("tomorrowFajrTimeLabel"),
            fajr,
        )
    }

    private fun countdownText(payload: JSONObject, untilMillis: Long): String {
        val totalMinutes = untilMillis / 60_000L
        if (totalMinutes <= 0L) return payload.optString("countdownNow")
        val hours = totalMinutes / 60L
        val minutes = totalMinutes % 60L
        return if (hours > 0L) {
            payload.optString("countdownHoursMinutes")
                .replace("{h}", hours.toString())
                .replace("{m}", minutes.toString())
        } else {
            payload.optString("countdownMinutes")
                .replace("{m}", minutes.toString())
        }
    }

    /**
     * Today's entry from the payload's 7-day content window; when the payload
     * is older than its window, the most recent past entry (better slightly
     * stale content than none).
     */
    private fun contentForToday(payload: JSONObject): JSONObject? {
        val days = payload.optJSONArray("days") ?: return null
        if (days.length() == 0) return null
        val todayKey = SimpleDateFormat("yyyy-MM-dd", Locale.US).format(Date())
        var mostRecentPast: JSONObject? = null
        for (i in 0 until days.length()) {
            val d = days.optJSONObject(i) ?: continue
            val key = d.optString("date")
            if (key == todayKey) return d
            if (key < todayKey) mostRecentPast = d
        }
        return mostRecentPast ?: days.optJSONObject(0)
    }

    /**
     * Safe to call every time the service (re)starts: only `name`/`description`
     * are mutable on an existing channel, and those are exactly what might
     * change here (e.g. after a language change) — importance/sound, which
     * can never be changed once set, stay fixed at IMPORTANCE_LOW/silent. LOW
     * (rather than MIN) is required so the icon still shows in the status bar,
     * since the whole point of this notification is to be visibly persistent.
     * lockscreenVisibility is PUBLIC so the prayer countdown and daily content
     * actually show on the lock screen.
     */
    private fun ensureChannel(name: String, description: String) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O) return
        val notifManager = getSystemService(NOTIFICATION_SERVICE) as NotificationManager
        notifManager.deleteNotificationChannel(LEGACY_CHANNEL_ID)
        val channel = NotificationChannel(CHANNEL_ID, name, NotificationManager.IMPORTANCE_LOW).apply {
            this.description = description
            setSound(null, null)
            enableVibration(false)
            setShowBadge(false)
            lockscreenVisibility = Notification.VISIBILITY_PUBLIC
        }
        notifManager.createNotificationChannel(channel)
    }
}
