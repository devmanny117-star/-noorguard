package com.example.noor_guard

import android.app.AlarmManager
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.os.Build
import android.provider.Settings
import android.view.KeyEvent
import androidx.core.app.NotificationCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    companion object {
        var adhanChannel: MethodChannel? = null
        var isAdhanPlaying = false

        // Distinct from the real prayer alarm ids (100-104) and the basic
        // test notification id (999) used by flutter_local_notifications, so
        // testing never collides with a scheduled prayer or its actions
        // (which use notifId+200/+300 as PendingIntent request codes).
        private const val TEST_ALARM_NOTIFICATION_ID = 199
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        adhanChannel = MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            "adhan_control"
        )
        adhanChannel?.setMethodCallHandler { call, result ->
            when (call.method) {
                "setPlaying" -> {
                    isAdhanPlaying = call.arguments as? Boolean ?: false
                    result.success(null)
                }
                "showSilentBanner" -> {
                    @Suppress("UNCHECKED_CAST")
                    val args = call.arguments as Map<String, Any>
                    showSilentBanner(
                        id = args["id"] as Int,
                        title = args["title"] as String,
                        body = args["body"] as String,
                    )
                    result.success(null)
                }
                "schedulePrayerAlarm" -> {
                    @Suppress("UNCHECKED_CAST")
                    val args = call.arguments as Map<String, Any>
                    schedulePrayerAlarm(args)
                    result.success(null)
                }
                "cancelPrayerAlarms" -> {
                    cancelPrayerAlarms()
                    result.success(null)
                }
                "getPendingPrayerMarks" -> {
                    result.success(getPendingPrayerMarks())
                }
                "canUseFullScreenIntent" -> {
                    result.success(canUseFullScreenIntent())
                }
                "openFullScreenIntentSettings" -> {
                    openFullScreenIntentSettings()
                    result.success(null)
                }
                "canDrawOverlays" -> {
                    result.success(Settings.canDrawOverlays(this))
                }
                "openOverlaySettings" -> {
                    openOverlaySettings()
                    result.success(null)
                }
                "canScheduleExactAlarms" -> {
                    result.success(canScheduleExactAlarms())
                }
                "openExactAlarmSettings" -> {
                    openExactAlarmSettings()
                    result.success(null)
                }
                "ensureAlarmChannel" -> {
                    @Suppress("UNCHECKED_CAST")
                    val args = call.arguments as Map<String, Any>
                    PrayerAlarmReceiver.ensureChannel(this, args["adhanId"] as String)
                    result.success(null)
                }
                "openAppNotificationSettings" -> {
                    @Suppress("UNCHECKED_CAST")
                    val args = call.arguments as? Map<String, Any?>
                    openAppNotificationSettings(args?.get("channelId") as? String)
                    result.success(null)
                }
                "scheduleTestAlarm" -> {
                    @Suppress("UNCHECKED_CAST")
                    val args = call.arguments as Map<String, Any>
                    scheduleTestAlarm(args["adhanId"] as String)
                    result.success(null)
                }
                else -> result.notImplemented()
            }
        }
    }

    override fun dispatchKeyEvent(event: KeyEvent): Boolean {
        if (isAdhanPlaying && event.action == KeyEvent.ACTION_DOWN) {
            if (event.keyCode == KeyEvent.KEYCODE_VOLUME_UP ||
                event.keyCode == KeyEvent.KEYCODE_VOLUME_DOWN
            ) {
                adhanChannel?.invokeMethod("stopAdhan", null)
                return true
            }
        }
        return super.dispatchKeyEvent(event)
    }

    private fun showSilentBanner(id: Int, title: String, body: String) {
        val channelId = "prayer_reminders_silent"
        val notifManager =
            getSystemService(NOTIFICATION_SERVICE) as NotificationManager

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(
                channelId,
                "Prayer Reminders",
                NotificationManager.IMPORTANCE_HIGH
            ).apply {
                setSound(null, null)
                enableVibration(false)
            }
            notifManager.createNotificationChannel(channel)
        }

        val stopIntent = Intent(this, AdhanStopReceiver::class.java).apply {
            action = AdhanStopReceiver.ACTION_STOP_ADHAN
        }
        val flags = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        } else {
            PendingIntent.FLAG_UPDATE_CURRENT
        }
        val stopPi = PendingIntent.getBroadcast(this, id, stopIntent, flags)

        val notification = NotificationCompat.Builder(this, channelId)
            .setSmallIcon(R.mipmap.ic_launcher)
            .setContentTitle(title)
            .setContentText(body)
            .setPriority(NotificationCompat.PRIORITY_HIGH)
            .setSound(null)
            .setVibrate(null)
            .setContentIntent(stopPi)
            .setDeleteIntent(stopPi)
            .setAutoCancel(true)
            .build()

        notifManager.notify(id, notification)
    }

    private fun schedulePrayerAlarm(args: Map<String, Any>) {
        val prayerName = args["prayerName"] as String
        val arabicName = args["arabicName"] as String
        val prayerTime = args["prayerTime"] as String
        val message = args["message"] as String
        val adhanId = args["adhanId"] as String
        val triggerAtMillis = (args["triggerAtMillis"] as Number).toLong()
        val notifId = (args["notificationId"] as Number).toInt()

        val alarmManager = getSystemService(Context.ALARM_SERVICE) as AlarmManager
        val intent = Intent(this, PrayerAlarmReceiver::class.java).apply {
            putExtra(PrayerAlarmReceiver.EXTRA_PRAYER_NAME, prayerName)
            putExtra(PrayerAlarmReceiver.EXTRA_PRAYER_ARABIC, arabicName)
            putExtra(PrayerAlarmReceiver.EXTRA_PRAYER_TIME, prayerTime)
            putExtra(PrayerAlarmReceiver.EXTRA_PRAYER_MESSAGE, message)
            putExtra(PrayerAlarmReceiver.EXTRA_ADHAN_ID, adhanId)
            putExtra(PrayerAlarmReceiver.EXTRA_NOTIFICATION_ID, notifId)
        }
        val pi = PendingIntent.getBroadcast(
            this, notifId, intent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            if (alarmManager.canScheduleExactAlarms()) {
                alarmManager.setExactAndAllowWhileIdle(
                    AlarmManager.RTC_WAKEUP, triggerAtMillis, pi
                )
            } else {
                alarmManager.setAndAllowWhileIdle(
                    AlarmManager.RTC_WAKEUP, triggerAtMillis, pi
                )
            }
        } else {
            alarmManager.setExactAndAllowWhileIdle(
                AlarmManager.RTC_WAKEUP, triggerAtMillis, pi
            )
        }
    }

    /**
     * Schedules a one-off alarm 10 seconds from now through the exact same
     * AlarmManager -> PrayerAlarmReceiver -> full-screen-intent path real
     * prayer alarms use, so the lock screen activity can be verified without
     * waiting for an actual prayer time.
     */
    private fun scheduleTestAlarm(adhanId: String) {
        schedulePrayerAlarm(
            mapOf(
                "prayerName" to "Test Alarm",
                "arabicName" to "تجربة",
                "prayerTime" to "Now",
                "message" to "This is a test of the full-screen lock alarm.",
                "adhanId" to adhanId,
                "triggerAtMillis" to (System.currentTimeMillis() + 10_000L),
                "notificationId" to TEST_ALARM_NOTIFICATION_ID,
            )
        )
    }

    private fun cancelPrayerAlarms() {
        val alarmManager = getSystemService(Context.ALARM_SERVICE) as AlarmManager
        for (id in 100..104) {
            val intent = Intent(this, PrayerAlarmReceiver::class.java)
            val pi = PendingIntent.getBroadcast(
                this, id, intent,
                PendingIntent.FLAG_NO_CREATE or PendingIntent.FLAG_IMMUTABLE
            )
            if (pi != null) {
                alarmManager.cancel(pi)
                pi.cancel()
            }
        }
    }

    private fun getPendingPrayerMarks(): List<String> {
        val prefs = getSharedPreferences("prayer_alarm_marks", Context.MODE_PRIVATE)
        val today = java.text.SimpleDateFormat("yyyy-MM-dd", java.util.Locale.US)
            .format(java.util.Date())
        val marked = prefs.getStringSet("marked_$today", emptySet()) ?: emptySet()
        prefs.edit().remove("marked_$today").apply()
        return marked.toList()
    }

    private fun canUseFullScreenIntent(): Boolean {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE) {
            val notifManager =
                getSystemService(NOTIFICATION_SERVICE) as NotificationManager
            return notifManager.canUseFullScreenIntent()
        }
        return true
    }

    private fun openFullScreenIntentSettings() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.UPSIDE_DOWN_CAKE) {
            try {
                val intent = Intent(
                    Settings.ACTION_MANAGE_APP_USE_FULL_SCREEN_INTENT,
                    android.net.Uri.parse("package:$packageName")
                )
                intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
                startActivity(intent)
            } catch (_: Exception) {}
        }
    }

    private fun openOverlaySettings() {
        try {
            val intent = Intent(
                Settings.ACTION_MANAGE_OVERLAY_PERMISSION,
                android.net.Uri.parse("package:$packageName")
            )
            intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
            startActivity(intent)
        } catch (_: Exception) {}
    }

    private fun canScheduleExactAlarms(): Boolean {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            val alarmManager = getSystemService(Context.ALARM_SERVICE) as AlarmManager
            return alarmManager.canScheduleExactAlarms()
        }
        return true
    }

    private fun openExactAlarmSettings() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
            try {
                val intent = Intent(
                    Settings.ACTION_REQUEST_SCHEDULE_EXACT_ALARM,
                    android.net.Uri.parse("package:$packageName")
                )
                intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
                startActivity(intent)
            } catch (_: Exception) {}
        }
    }

    /**
     * Opens this app's notification settings page. On Samsung One UI this is
     * where the "Pop-up notification" (sometimes "Cover screen pop-up" on
     * Fold/Flip) toggle lives per-channel — there's no dedicated public Intent
     * action for it, so this is the closest reliable deep link. Passing
     * [channelId] jumps straight to that channel's settings instead of the
     * app's general notification settings list.
     */
    private fun openAppNotificationSettings(channelId: String?) {
        try {
            val intent = Intent(Settings.ACTION_APP_NOTIFICATION_SETTINGS)
            intent.putExtra(Settings.EXTRA_APP_PACKAGE, packageName)
            if (channelId != null) {
                intent.putExtra(Settings.EXTRA_CHANNEL_ID, channelId)
            }
            intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
            startActivity(intent)
        } catch (_: Exception) {}
    }
}
