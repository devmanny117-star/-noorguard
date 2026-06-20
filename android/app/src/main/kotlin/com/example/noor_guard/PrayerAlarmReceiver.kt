package com.example.noor_guard

import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.media.AudioAttributes
import android.net.Uri
import android.os.Build
import android.os.PowerManager
import androidx.core.app.NotificationCompat

/** Fires at the exact prayer time and posts the full-screen alarm notification. */
class PrayerAlarmReceiver : BroadcastReceiver() {

    companion object {
        const val EXTRA_PRAYER_NAME = "prayer_name"
        const val EXTRA_PRAYER_ARABIC = "prayer_arabic"
        const val EXTRA_PRAYER_TIME = "prayer_time"
        const val EXTRA_PRAYER_MESSAGE = "prayer_message"
        const val EXTRA_ADHAN_ID = "adhan_id"
        const val EXTRA_NOTIFICATION_ID = "notification_id"
        // Serialized as "name,timeStr,epochMillis;name,timeStr,epochMillis;..." for
        // all 5 of today's prayers, so the lock screen Activity can show the full
        // pills row regardless of which alarm fired.
        const val EXTRA_ALL_PRAYERS = "all_prayers"

        fun channelIdFor(adhanId: String) = "prayer_alarm_$adhanId"

        /**
         * Creates the alarm channel for [adhanId] if it doesn't already exist.
         *
         * IMPORTANT: never delete-then-recreate an existing channel here. Once a
         * user opens Settings and grants the OEM-specific "pop-up"/"full screen"
         * toggle for this channel (Samsung One UI exposes this per-channel),
         * deleting the channel resets it to defaults and silently revokes that
         * choice. Since each adhan style already has its own channel id, the
         * sound is fixed for the lifetime of that id and there's never a reason
         * to delete it — createNotificationChannel() is a safe no-op if the
         * channel already exists.
         */
        fun ensureChannel(context: Context, adhanId: String) {
            if (Build.VERSION.SDK_INT < Build.VERSION_CODES.O) return
            val notifManager =
                context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
            val channelId = channelIdFor(adhanId)
            val soundResource = "adhan_$adhanId"
            val soundUri = Uri.parse(
                "android.resource://${context.packageName}/raw/$soundResource"
            )
            val channel = NotificationChannel(
                channelId,
                "Prayer Time Alarm",
                NotificationManager.IMPORTANCE_HIGH
            ).apply {
                description = "Full-screen prayer time alarm with adhan"
                setSound(
                    soundUri,
                    AudioAttributes.Builder()
                        .setUsage(AudioAttributes.USAGE_ALARM)
                        .setContentType(AudioAttributes.CONTENT_TYPE_SONIFICATION)
                        .build()
                )
                enableVibration(true)
                vibrationPattern = longArrayOf(0, 500, 200, 500)
                setBypassDnd(true)
                lockscreenVisibility = android.app.Notification.VISIBILITY_PUBLIC
            }
            notifManager.createNotificationChannel(channel)
        }
    }

    override fun onReceive(context: Context, intent: Intent) {
        val prayerName = intent.getStringExtra(EXTRA_PRAYER_NAME) ?: return
        val arabicName = intent.getStringExtra(EXTRA_PRAYER_ARABIC) ?: ""
        val prayerTime = intent.getStringExtra(EXTRA_PRAYER_TIME) ?: ""
        val message = intent.getStringExtra(EXTRA_PRAYER_MESSAGE) ?: ""
        val adhanId = intent.getStringExtra(EXTRA_ADHAN_ID) ?: "makkah"
        val notifId = intent.getIntExtra(EXTRA_NOTIFICATION_ID, 100)
        val allPrayers = intent.getStringExtra(EXTRA_ALL_PRAYERS) ?: ""

        // Acquire a partial wake lock so the device stays awake long enough
        // to post the notification and launch the full-screen Activity.
        val powerManager = context.getSystemService(Context.POWER_SERVICE) as PowerManager
        val wakeLock = powerManager.newWakeLock(
            PowerManager.PARTIAL_WAKE_LOCK or PowerManager.ACQUIRE_CAUSES_WAKEUP,
            "noor_guard:prayer_alarm"
        )
        wakeLock.acquire(10_000L)

        try {
            showAlarmNotification(
                context, prayerName, arabicName, prayerTime, message, adhanId, notifId, allPrayers
            )
        } finally {
            wakeLock.release()
        }
    }

    private fun showAlarmNotification(
        context: Context,
        prayerName: String,
        arabicName: String,
        prayerTime: String,
        message: String,
        adhanId: String,
        notifId: Int,
        allPrayers: String,
    ) {
        val notifManager =
            context.getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager

        val channelId = channelIdFor(adhanId)
        val soundResource = "adhan_$adhanId"
        val soundUri = Uri.parse(
            "android.resource://${context.packageName}/raw/$soundResource"
        )

        ensureChannel(context, adhanId)

        // Full-screen intent — launches PrayerAlarmActivity over the lock screen.
        val fullScreenIntent = Intent(context, PrayerAlarmActivity::class.java).apply {
            putExtra(EXTRA_PRAYER_NAME, prayerName)
            putExtra(EXTRA_PRAYER_ARABIC, arabicName)
            putExtra(EXTRA_PRAYER_TIME, prayerTime)
            putExtra(EXTRA_PRAYER_MESSAGE, message)
            putExtra(EXTRA_ADHAN_ID, adhanId)
            putExtra(EXTRA_NOTIFICATION_ID, notifId)
            putExtra(EXTRA_ALL_PRAYERS, allPrayers)
            flags = Intent.FLAG_ACTIVITY_NEW_TASK or
                    Intent.FLAG_ACTIVITY_CLEAR_TOP or
                    Intent.FLAG_ACTIVITY_NO_USER_ACTION
        }
        val fullScreenPi = PendingIntent.getActivity(
            context, notifId, fullScreenIntent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )

        // "I Prayed" action
        val prayedIntent = Intent(context, PrayerActionReceiver::class.java).apply {
            action = PrayerActionReceiver.ACTION_PRAYED
            putExtra(EXTRA_PRAYER_NAME, prayerName)
            putExtra(EXTRA_NOTIFICATION_ID, notifId)
        }
        val prayedPi = PendingIntent.getBroadcast(
            context, notifId + 200, prayedIntent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )

        // "Dismiss" action
        val dismissIntent = Intent(context, PrayerActionReceiver::class.java).apply {
            action = PrayerActionReceiver.ACTION_DISMISS
            putExtra(EXTRA_NOTIFICATION_ID, notifId)
        }
        val dismissPi = PendingIntent.getBroadcast(
            context, notifId + 300, dismissIntent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )

        val notification = NotificationCompat.Builder(context, channelId)
            .setSmallIcon(R.mipmap.ic_launcher)
            .setContentTitle("$prayerName  $arabicName")
            .setContentText(message)
            .setSubText(prayerTime)
            .setShowWhen(false)
            .setPriority(NotificationCompat.PRIORITY_MAX)
            .setCategory(NotificationCompat.CATEGORY_ALARM)
            .setVisibility(NotificationCompat.VISIBILITY_PUBLIC)
            .setFullScreenIntent(fullScreenPi, true)
            .setContentIntent(fullScreenPi)
            .addAction(0, "I Prayed ✓", prayedPi)
            .addAction(0, "Dismiss", dismissPi)
            .setSound(soundUri)
            .setVibrate(longArrayOf(0, 500, 200, 500))
            .setAutoCancel(false)
            .setOngoing(true)
            .build()

        notifManager.notify(notifId, notification)
    }
}
