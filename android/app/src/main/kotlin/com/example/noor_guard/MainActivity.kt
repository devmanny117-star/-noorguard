package com.example.noor_guard

import android.app.AlarmManager
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.os.Build
import android.os.PowerManager
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
                "isSamsungDevice" -> {
                    result.success(Build.MANUFACTURER.equals("samsung", ignoreCase = true))
                }
                "isIgnoringBatteryOptimizations" -> {
                    result.success(isIgnoringBatteryOptimizations())
                }
                "openBatteryOptimizationSettings" -> {
                    openBatteryOptimizationSettings()
                    result.success(null)
                }
                "openSamsungBackgroundUsageSettings" -> {
                    openSamsungBackgroundUsageSettings()
                    result.success(null)
                }
                "startKeepAliveService" -> {
                    @Suppress("UNCHECKED_CAST")
                    val args = call.arguments as Map<String, Any>
                    PrayerForegroundService.start(
                        this,
                        args["title"] as String,
                        args["text"] as String,
                        args["channelName"] as String,
                        args["channelDescription"] as String,
                    )
                    maybeRequestSamsungBatteryExemption()
                    result.success(null)
                }
                "stopKeepAliveService" -> {
                    PrayerForegroundService.stop(this)
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

        @Suppress("UNCHECKED_CAST")
        val allPrayersRaw = args["allPrayers"] as? List<Map<String, Any>>
        val allPrayersSerialized = allPrayersRaw?.joinToString(";") { entry ->
            val name = entry["name"] as String
            val time = entry["time"] as String
            val millis = (entry["epochMillis"] as Number).toLong()
            "$name,$time,$millis"
        } ?: ""

        val alarmManager = getSystemService(Context.ALARM_SERVICE) as AlarmManager
        val intent = Intent(this, PrayerAlarmReceiver::class.java).apply {
            putExtra(PrayerAlarmReceiver.EXTRA_PRAYER_NAME, prayerName)
            putExtra(PrayerAlarmReceiver.EXTRA_PRAYER_ARABIC, arabicName)
            putExtra(PrayerAlarmReceiver.EXTRA_PRAYER_TIME, prayerTime)
            putExtra(PrayerAlarmReceiver.EXTRA_PRAYER_MESSAGE, message)
            putExtra(PrayerAlarmReceiver.EXTRA_ADHAN_ID, adhanId)
            putExtra(PrayerAlarmReceiver.EXTRA_NOTIFICATION_ID, notifId)
            putExtra(PrayerAlarmReceiver.EXTRA_ALL_PRAYERS, allPrayersSerialized)
        }
        val pi = PendingIntent.getBroadcast(
            this, notifId, intent,
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )

        // setAlarmClock() — not setExactAndAllowWhileIdle() — is what keeps this
        // firing on time under Doze AND under Battery Saver, without asking the
        // user to turn Battery Saver off or grant anything: Android exempts
        // "alarm clock" alarms from both unconditionally (the same mechanism
        // alarm-clock apps rely on), and unlike setExact/setExactAndAllowWhileIdle
        // it needs no SCHEDULE_EXACT_ALARM permission at all — the status bar's
        // alarm icon is considered sufficient transparency to the user. Tapping
        // that icon opens the app via showIntent.
        val showIntent = PendingIntent.getActivity(
            this, notifId, Intent(this, MainActivity::class.java),
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
        )
        alarmManager.setAlarmClock(
            AlarmManager.AlarmClockInfo(triggerAtMillis, showIntent), pi
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

    private fun isIgnoringBatteryOptimizations(): Boolean {
        val powerManager = getSystemService(Context.POWER_SERVICE) as PowerManager
        return powerManager.isIgnoringBatteryOptimizations(packageName)
    }

    /**
     * Samsung's own battery management is more aggressive than stock Android's,
     * so the keep-alive foreground service alone isn't always enough there —
     * the user still has to grant the per-app "ignore battery optimizations"
     * exemption for the service to be reliably left alone. Asked for once,
     * automatically, the first time the service starts on a Samsung device;
     * never asked again after that (whether granted or denied), so the user
     * isn't nagged — they can still grant it anytime via the Lock Screen Alert
     * Setup Guide. This never touches the system-wide Battery Saver toggle
     * itself, only this app's exemption from it.
     */
    private fun maybeRequestSamsungBatteryExemption() {
        if (!Build.MANUFACTURER.equals("samsung", ignoreCase = true)) return
        if (isIgnoringBatteryOptimizations()) return
        val prefs = getSharedPreferences("battery_optimization_prefs", Context.MODE_PRIVATE)
        if (prefs.getBoolean("samsung_auto_prompt_shown", false)) return
        prefs.edit().putBoolean("samsung_auto_prompt_shown", true).apply()
        openBatteryOptimizationSettings()
    }

    /**
     * Tries the direct system "ignore battery optimizations" dialog first,
     * since granting it is the one-tap equivalent of the per-app
     * Settings -> Apps -> Noor Guard -> Battery -> Unrestricted switch. Falls
     * back to that app-info page directly if the dialog's Intent isn't
     * handled (some heavily modified ROMs strip it).
     */
    private fun openBatteryOptimizationSettings() {
        try {
            val intent = Intent(
                Settings.ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS,
                android.net.Uri.parse("package:$packageName")
            )
            intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
            startActivity(intent)
        } catch (_: Exception) {
            openAppDetailsSettings()
        }
    }

    private fun openAppDetailsSettings() {
        try {
            val intent = Intent(
                Settings.ACTION_APPLICATION_DETAILS_SETTINGS,
                android.net.Uri.parse("package:$packageName")
            )
            intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
            startActivity(intent)
        } catch (_: Exception) {}
    }

    /**
     * Opens the Battery screen of Samsung's Device Care app, where
     * "Background usage limits -> Never sleeping apps" lives (Samsung's own
     * battery manager, separate from stock Android's battery optimization).
     * There's no public Intent action for this Samsung-only screen, so this
     * targets the known activity directly and falls back to this app's
     * details page if the device doesn't have it (non-Samsung, or a One UI
     * version that renamed it).
     */
    private fun openSamsungBackgroundUsageSettings() {
        val componentsToTry = listOf(
            // Confirmed working on One UI / Android 16 (API 36).
            ComponentName(
                "com.samsung.android.lool",
                "com.samsung.android.sm.battery.ui.BatteryActivity"
            ),
            // Older One UI versions used this package order instead.
            ComponentName(
                "com.samsung.android.lool",
                "com.samsung.android.sm.ui.battery.BatteryActivity"
            ),
        )
        for (component in componentsToTry) {
            try {
                val intent = Intent().apply {
                    this.component = component
                    flags = Intent.FLAG_ACTIVITY_NEW_TASK
                }
                startActivity(intent)
                return
            } catch (_: Exception) {
                // Try the next known component name.
            }
        }
        openAppDetailsSettings()
    }
}
