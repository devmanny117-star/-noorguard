package com.example.noor_guard

import android.app.Activity
import android.app.KeyguardManager
import android.app.NotificationManager
import android.content.Context
import android.os.Build
import android.os.Bundle
import android.view.WindowManager
import android.view.animation.AlphaAnimation
import android.view.animation.Animation
import android.widget.TextView

class PrayerAlarmActivity : Activity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        showOverLockScreen()
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_prayer_alarm)

        val prayerName = intent.getStringExtra(PrayerAlarmReceiver.EXTRA_PRAYER_NAME) ?: "Prayer"
        val arabicName = intent.getStringExtra(PrayerAlarmReceiver.EXTRA_PRAYER_ARABIC) ?: ""
        val prayerTime = intent.getStringExtra(PrayerAlarmReceiver.EXTRA_PRAYER_TIME) ?: ""
        val message = intent.getStringExtra(PrayerAlarmReceiver.EXTRA_PRAYER_MESSAGE) ?: ""
        val notifId = intent.getIntExtra(PrayerAlarmReceiver.EXTRA_NOTIFICATION_ID, 100)

        findViewById<TextView>(R.id.textPrayerName).text = prayerName
        findViewById<TextView>(R.id.textArabicName).text = arabicName
        findViewById<TextView>(R.id.textPrayerTime).text = prayerTime
        findViewById<TextView>(R.id.textMessage).text = message

        findViewById<TextView>(R.id.btnIPrayed).setOnClickListener {
            markPrayer(prayerName)
            dismissAlarm(notifId)
        }

        findViewById<TextView>(R.id.btnDismiss).setOnClickListener {
            dismissAlarm(notifId)
        }

        pulseAdhanBadge()
    }

    /** Slow opacity pulse on the "Adhan Playing" badge so it reads as a live indicator. */
    private fun pulseAdhanBadge() {
        val badge = findViewById<android.widget.LinearLayout>(R.id.badgeAdhanPlaying)
        val pulse = AlphaAnimation(1f, 0.45f).apply {
            duration = 900
            repeatMode = Animation.REVERSE
            repeatCount = Animation.INFINITE
        }
        badge.startAnimation(pulse)
    }

    private fun showOverLockScreen() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O_MR1) {
            setShowWhenLocked(true)
            setTurnScreenOn(true)
            val keyguardManager = getSystemService(Context.KEYGUARD_SERVICE) as KeyguardManager
            keyguardManager.requestDismissKeyguard(this, null)
        }

        @Suppress("DEPRECATION")
        window.addFlags(
            WindowManager.LayoutParams.FLAG_SHOW_WHEN_LOCKED
                or WindowManager.LayoutParams.FLAG_TURN_SCREEN_ON
                or WindowManager.LayoutParams.FLAG_DISMISS_KEYGUARD
                or WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON
                or WindowManager.LayoutParams.FLAG_ALLOW_LOCK_WHILE_SCREEN_ON
        )
    }

    private fun markPrayer(prayerName: String) {
        val prefs = getSharedPreferences("prayer_alarm_marks", Context.MODE_PRIVATE)
        val today = java.text.SimpleDateFormat("yyyy-MM-dd", java.util.Locale.US)
            .format(java.util.Date())
        val existing = prefs.getStringSet("marked_$today", mutableSetOf())
            ?: mutableSetOf()
        val updated = existing.toMutableSet()
        updated.add(prayerName)
        prefs.edit().putStringSet("marked_$today", updated).apply()
    }

    private fun dismissAlarm(notifId: Int) {
        val notifManager = getSystemService(NOTIFICATION_SERVICE) as NotificationManager
        notifManager.cancel(notifId)
        finishAndRemoveTask()
    }
}
