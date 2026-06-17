package com.example.noor_guard

import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.Intent
import android.os.Build
import android.view.KeyEvent
import androidx.core.app.NotificationCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    companion object {
        /// Shared with [AdhanStopReceiver] so it can signal Dart to stop the adhan
        /// when the user taps or swipes away the silent prayer banner.
        var adhanChannel: MethodChannel? = null

        /// Tracks whether the foreground adhan is playing. Set by Dart via
        /// setPlaying so dispatchKeyEvent knows when to consume volume keys.
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
                else -> result.notImplemented()
            }
        }
    }

    /// Intercepts volume-up and volume-down key presses while the adhan is
    /// playing and forwards a stopAdhan call to Dart. For all other key events,
    /// or when no adhan is active, the event is passed through normally.
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

    /// Posts a high-priority, soundless notification whose contentIntent (tap)
    /// and deleteIntent (swipe-dismiss) both fire [AdhanStopReceiver], which
    /// in turn signals Dart to stop the in-app adhan.
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
}
