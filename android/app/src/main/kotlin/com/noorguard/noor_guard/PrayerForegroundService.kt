package com.noorguard.noor_guard

import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.app.Service
import android.content.Context
import android.content.Intent
import android.content.pm.ServiceInfo
import android.os.Build
import android.os.IBinder
import androidx.core.app.NotificationCompat
import androidx.core.content.ContextCompat

/**
 * Foreground service whose only job is to keep the app process classified as
 * "foreground" by Android, so prayer-time `AlarmManager` broadcasts and their
 * notifications keep being delivered when the OS would otherwise treat the
 * process as idle/background and defer or drop them. It does no work itself —
 * the persistent, low-priority notification it must show per the Android
 * foreground-service contract is the same one this feature exists to keep
 * reliable.
 *
 * Title/text/channel name are passed in from Dart already localized, since
 * native code has no access to the app's selected language.
 */
class PrayerForegroundService : Service() {

    companion object {
        private const val CHANNEL_ID = "prayer_keep_alive"
        private const val NOTIFICATION_ID = 9001

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
            if (!prefs.getBoolean(KEY_ENABLED, false)) return
            val title = prefs.getString(KEY_TITLE, "Noor Guard") ?: "Noor Guard"
            val text = prefs.getString(KEY_TEXT, "Prayer notifications active")
                ?: "Prayer notifications active"
            val channelName = prefs.getString(KEY_CHANNEL_NAME, "Prayer Notifications")
                ?: "Prayer Notifications"
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

    override fun onBind(intent: Intent?): IBinder? = null

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        val title = intent?.getStringExtra(EXTRA_TITLE) ?: "Noor Guard"
        val text = intent?.getStringExtra(EXTRA_TEXT) ?: "Prayer notifications active"
        val channelName = intent?.getStringExtra(EXTRA_CHANNEL_NAME) ?: "Prayer Notifications"
        val channelDescription = intent?.getStringExtra(EXTRA_CHANNEL_DESCRIPTION) ?: ""

        ensureChannel(channelName, channelDescription)

        val openAppIntent = packageManager.getLaunchIntentForPackage(packageName)
        val contentPi = openAppIntent?.let {
            PendingIntent.getActivity(
                this, 0, it,
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
            )
        }

        val notification = NotificationCompat.Builder(this, CHANNEL_ID)
            .setSmallIcon(R.mipmap.ic_launcher)
            .setContentTitle(title)
            .setContentText(text)
            .setPriority(NotificationCompat.PRIORITY_LOW)
            .setOngoing(true)
            .setShowWhen(false)
            .setContentIntent(contentPi)
            .build()

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE) {
            startForeground(NOTIFICATION_ID, notification, ServiceInfo.FOREGROUND_SERVICE_TYPE_SPECIAL_USE)
        } else {
            startForeground(NOTIFICATION_ID, notification)
        }

        return START_STICKY
    }

    /**
     * Safe to call every time the service (re)starts: only `name`/`description`
     * are mutable on an existing channel, and those are exactly what might
     * change here (e.g. after a language change) — importance/sound, which
     * can never be changed once set, stay fixed at IMPORTANCE_LOW/silent. LOW
     * (rather than MIN) is required so the icon still shows in the status bar,
     * since the whole point of this notification is to be visibly persistent.
     */
    private fun ensureChannel(name: String, description: String) {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O) return
        val notifManager = getSystemService(NOTIFICATION_SERVICE) as NotificationManager
        val channel = NotificationChannel(CHANNEL_ID, name, NotificationManager.IMPORTANCE_LOW).apply {
            this.description = description
            setSound(null, null)
            enableVibration(false)
            setShowBadge(false)
        }
        notifManager.createNotificationChannel(channel)
    }
}
