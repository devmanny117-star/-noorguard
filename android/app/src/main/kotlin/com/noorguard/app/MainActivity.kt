package com.noorguard.app

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
import com.ryanheise.audioservice.AudioServiceActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

// Extends AudioServiceActivity (not plain FlutterActivity) so this activity
// shares its Flutter engine with the just_audio_background foreground
// service powering the Quran reader's lock screen media controls.
class MainActivity : AudioServiceActivity() {

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

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            "app_blocking_control"
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                "updateBlockingConfig" -> {
                    @Suppress("UNCHECKED_CAST")
                    val args = call.arguments as Map<String, Any>
                    updateBlockingConfig(args)
                    result.success(null)
                }
                "getInstalledApps" -> {
                    result.success(getInstalledApps())
                }
                "isAccessibilityServiceEnabled" -> {
                    result.success(isAccessibilityServiceEnabled())
                }
                "openAccessibilitySettings" -> {
                    startActivity(
                        Intent(Settings.ACTION_ACCESSIBILITY_SETTINGS)
                            .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                    )
                    result.success(null)
                }
                "getPendingAyahChallenge" -> {
                    result.success(getPendingAyahChallenge())
                }
                "grantAyahChallengeBypass" -> {
                    @Suppress("UNCHECKED_CAST")
                    val args = call.arguments as Map<String, Any>
                    val pkg = args["packageName"] as String
                    val until = (args["untilMillis"] as Number).toLong()
                    AppBlockingStore(this).grantBypassUntil(pkg, until)
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

    private fun updateBlockingConfig(args: Map<String, Any>) {
        val enabled = args["enabled"] as? Boolean ?: false
        val mode = args["mode"] as? String ?: "firm"
        @Suppress("UNCHECKED_CAST")
        val blockedPackages = (args["blockedPackages"] as? List<String>) ?: emptyList()
        @Suppress("UNCHECKED_CAST")
        val windows = (args["windows"] as? List<Map<String, Any>>) ?: emptyList()
        val windowsSerialized = windows.joinToString(";") { w ->
            val name = w["prayerName"] as String
            val start = (w["startEpochMillis"] as Number).toLong()
            val end = (w["endEpochMillis"] as Number).toLong()
            "$name,$start,$end"
        }
        val locale = args["locale"] as? String ?: "en"
        @Suppress("UNCHECKED_CAST")
        val strings = (args["strings"] as? Map<String, String>) ?: emptyMap()
        AppBlockingStore(this).write(enabled, mode, blockedPackages, windowsSerialized, locale, strings)
    }

    /**
     * Launchable, non-system apps the user can choose to block — queried via
     * the `<queries>` LAUNCHER intent declared in the manifest, so this needs
     * no QUERY_ALL_PACKAGES permission.
     */
    private fun getInstalledApps(): List<Map<String, Any?>> {
        val pm = packageManager
        val launcherIntent = Intent(Intent.ACTION_MAIN).addCategory(Intent.CATEGORY_LAUNCHER)
        val resolved = pm.queryIntentActivities(launcherIntent, 0)
        val seen = mutableSetOf<String>()
        val results = mutableListOf<Map<String, Any?>>()
        for (info in resolved) {
            val pkg = info.activityInfo.packageName
            if (pkg == packageName) continue
            if (!seen.add(pkg)) continue
            val appInfo = info.activityInfo.applicationInfo
            val isSystemApp = (appInfo.flags and android.content.pm.ApplicationInfo.FLAG_SYSTEM) != 0
            // info.loadIcon() — not a second pm.getApplicationIcon(pkg) lookup —
            // resolves the icon directly from this already-visible ResolveInfo,
            // the exact same call the real launcher makes for its home screen
            // icons. A separate by-package-name lookup can silently fail under
            // Android 11+ package-visibility filtering and fall back to a
            // generic icon, which is what made these look like placeholders.
            val iconBytes = try {
                iconToPngBytes(info.loadIcon(pm))
            } catch (_: Exception) {
                null
            }
            results.add(
                mapOf(
                    "packageName" to pkg,
                    "appName" to pm.getApplicationLabel(appInfo).toString(),
                    "icon" to iconBytes,
                    "isSystemApp" to isSystemApp,
                )
            )
        }
        return results
    }

    private fun iconToPngBytes(drawable: android.graphics.drawable.Drawable): ByteArray {
        // 144px covers up to ~xxhdpi at the picker's 38dp row icon size without
        // visible upscaling blur on high-density phones.
        val size = 144
        val bitmap = if (drawable is android.graphics.drawable.BitmapDrawable) {
            android.graphics.Bitmap.createScaledBitmap(drawable.bitmap, size, size, true)
        } else {
            val bmp = android.graphics.Bitmap.createBitmap(
                size, size, android.graphics.Bitmap.Config.ARGB_8888
            )
            val canvas = android.graphics.Canvas(bmp)
            drawable.setBounds(0, 0, size, size)
            drawable.draw(canvas)
            bmp
        }
        val stream = java.io.ByteArrayOutputStream()
        bitmap.compress(android.graphics.Bitmap.CompressFormat.PNG, 100, stream)
        return stream.toByteArray()
    }

    private fun isAccessibilityServiceEnabled(): Boolean {
        val expected = "$packageName/${AppBlockerAccessibilityService::class.java.name}"
        val enabledServices = Settings.Secure.getString(
            contentResolver, Settings.Secure.ENABLED_ACCESSIBILITY_SERVICES
        ) ?: return false
        return enabledServices.split(":").any { it.equals(expected, ignoreCase = true) }
    }

    /**
     * Reads (and consumes) the ayah-challenge extras BlockActivity attaches
     * when launching this Activity for the "Read 3 Ayahs" flow. Consuming
     * means removing the extras from the live Intent so a second call (e.g.
     * a Dart-side hot restart) doesn't replay the same challenge.
     */
    private fun getPendingAyahChallenge(): Map<String, Any?>? {
        if (!intent.getBooleanExtra(BlockActivity.EXTRA_AYAH_CHALLENGE, false)) return null
        val pkg = intent.getStringExtra(BlockActivity.EXTRA_BLOCKED_PACKAGE)
        val prayerName = intent.getStringExtra(BlockActivity.EXTRA_PRAYER_NAME)
        val windowEnd = intent.getLongExtra(BlockActivity.EXTRA_WINDOW_END_MILLIS, 0L)
        intent.removeExtra(BlockActivity.EXTRA_AYAH_CHALLENGE)
        intent.removeExtra(BlockActivity.EXTRA_BLOCKED_PACKAGE)
        intent.removeExtra(BlockActivity.EXTRA_PRAYER_NAME)
        intent.removeExtra(BlockActivity.EXTRA_WINDOW_END_MILLIS)
        if (pkg == null) return null
        return mapOf(
            "blockedPackage" to pkg,
            "prayerName" to prayerName,
            "windowEndMillis" to windowEnd,
        )
    }
}
