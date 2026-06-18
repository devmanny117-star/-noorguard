package com.example.noor_guard

import android.app.Activity
import android.app.KeyguardManager
import android.app.NotificationManager
import android.content.Context
import android.os.Build
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.view.Gravity
import android.view.View
import android.view.WindowManager
import android.view.animation.AlphaAnimation
import android.view.animation.Animation
import android.widget.LinearLayout
import android.widget.TextView
import androidx.core.content.ContextCompat
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale
import java.util.concurrent.TimeUnit

class PrayerAlarmActivity : Activity() {

    private data class ScheduleEntry(val name: String, val timeStr: String, val epochMillis: Long)

    private enum class PillState { CURRENT, PASSED, UPCOMING }

    private val handler = Handler(Looper.getMainLooper())
    private var tickRunnable: Runnable? = null
    private var nextPrayerEpoch: Long = 0L

    override fun onCreate(savedInstanceState: Bundle?) {
        showOverLockScreen()
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_prayer_alarm)

        val prayerName = intent.getStringExtra(PrayerAlarmReceiver.EXTRA_PRAYER_NAME) ?: "Prayer"
        val prayerTime = intent.getStringExtra(PrayerAlarmReceiver.EXTRA_PRAYER_TIME) ?: ""
        val notifId = intent.getIntExtra(PrayerAlarmReceiver.EXTRA_NOTIFICATION_ID, 100)
        val schedule = parseSchedule(intent.getStringExtra(PrayerAlarmReceiver.EXTRA_ALL_PRAYERS))

        bindNextPrayer(schedule, firingName = prayerName, firingTime = prayerTime)
        bindPrayerPills(schedule, currentName = prayerName)
        startClockTicker()

        findViewById<TextView>(R.id.btnIPrayed).setOnClickListener {
            markPrayer(prayerName)
            dismissAlarm(notifId)
        }

        findViewById<TextView>(R.id.btnDismiss).setOnClickListener {
            dismissAlarm(notifId)
        }

        pulseAdhanBadge()
    }

    private fun parseSchedule(raw: String?): List<ScheduleEntry> {
        if (raw.isNullOrBlank()) return emptyList()
        return raw.split(";").mapNotNull { item ->
            val parts = item.split(",")
            if (parts.size != 3) return@mapNotNull null
            val millis = parts[2].toLongOrNull() ?: return@mapNotNull null
            ScheduleEntry(parts[0], parts[1], millis)
        }
    }

    /** Finds the next upcoming prayer after now; wraps to the first prayer +24h if all 5 have passed. */
    private fun bindNextPrayer(schedule: List<ScheduleEntry>, firingName: String, firingTime: String) {
        val now = System.currentTimeMillis()
        val upcoming = schedule.filter { it.epochMillis > now }.minByOrNull { it.epochMillis }
        val next = upcoming ?: schedule.minByOrNull { it.epochMillis }?.let {
            it.copy(epochMillis = it.epochMillis + TimeUnit.DAYS.toMillis(1))
        }

        findViewById<TextView>(R.id.textNextPrayerName).text = next?.name ?: firingName
        findViewById<TextView>(R.id.textNextPrayerTime).text = next?.timeStr ?: firingTime
        nextPrayerEpoch = next?.epochMillis ?: 0L
        findViewById<TextView>(R.id.textCountdown).visibility =
            if (nextPrayerEpoch > 0) View.VISIBLE else View.GONE
    }

    private fun bindPrayerPills(schedule: List<ScheduleEntry>, currentName: String) {
        val row = findViewById<LinearLayout>(R.id.prayerPillsRow)
        if (schedule.isEmpty()) {
            row.visibility = View.GONE
            return
        }
        val now = System.currentTimeMillis()
        for (entry in schedule) {
            val state = when {
                entry.name == currentName -> PillState.CURRENT
                entry.epochMillis <= now -> PillState.PASSED
                else -> PillState.UPCOMING
            }
            row.addView(buildPillView(entry, state))
        }
    }

    private fun buildPillView(entry: ScheduleEntry, state: PillState): LinearLayout {
        val density = resources.displayMetrics.density
        fun dp(value: Int) = (value * density).toInt()

        val container = LinearLayout(this).apply {
            orientation = LinearLayout.VERTICAL
            gravity = Gravity.CENTER
            alpha = if (state == PillState.PASSED) 0.55f else 1f
            layoutParams = LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f).also {
                it.marginStart = dp(3)
                it.marginEnd = dp(3)
            }
            setPadding(dp(2), dp(10), dp(2), dp(10))
            background = ContextCompat.getDrawable(
                this@PrayerAlarmActivity,
                if (state == PillState.CURRENT) R.drawable.bg_pill_current else R.drawable.bg_pill_outline
            )
        }

        val textColor = ContextCompat.getColor(
            this, if (state == PillState.CURRENT) R.color.navy else R.color.cream
        )
        val timeColor = ContextCompat.getColor(
            this, if (state == PillState.CURRENT) R.color.navy else R.color.gold
        )

        container.addView(TextView(this).apply {
            text = prayerEmoji(entry.name)
            textSize = 15f
            gravity = Gravity.CENTER
        })
        container.addView(TextView(this).apply {
            text = entry.name
            setTextColor(textColor)
            textSize = 11f
            gravity = Gravity.CENTER
            setPadding(0, dp(4), 0, 0)
        })
        container.addView(TextView(this).apply {
            text = entry.timeStr.replace(" AM", "").replace(" PM", "")
            setTextColor(timeColor)
            textSize = 10f
            gravity = Gravity.CENTER
        })

        return container
    }

    private fun prayerEmoji(name: String) = when (name) {
        "Fajr" -> "🌅"
        "Dhuhr" -> "☀️"
        "Asr" -> "🌤️"
        "Maghrib" -> "🌇"
        "Isha" -> "🌙"
        else -> "🕓"
    }

    private fun startClockTicker() {
        val dateFormat = SimpleDateFormat("EEEE, MMMM d", Locale.getDefault())
        val timeFormat = SimpleDateFormat("h:mm a", Locale.getDefault())
        val dateView = findViewById<TextView>(R.id.textCurrentDate)
        val timeView = findViewById<TextView>(R.id.textCurrentTime)
        val countdownView = findViewById<TextView>(R.id.textCountdown)

        val runnable = object : Runnable {
            override fun run() {
                val now = Date()
                dateView.text = dateFormat.format(now).uppercase(Locale.getDefault())
                timeView.text = timeFormat.format(now)

                if (nextPrayerEpoch > 0) {
                    val remaining = nextPrayerEpoch - System.currentTimeMillis()
                    countdownView.text = "in ${formatCountdown(remaining)}"
                }
                handler.postDelayed(this, 1000L)
            }
        }
        tickRunnable = runnable
        handler.post(runnable)
    }

    private fun formatCountdown(millis: Long): String {
        val totalSeconds = (millis / 1000).coerceAtLeast(0)
        val hours = totalSeconds / 3600
        val minutes = (totalSeconds % 3600) / 60
        val seconds = totalSeconds % 60
        return String.format(Locale.US, "%02d:%02d:%02d", hours, minutes, seconds)
    }

    override fun onDestroy() {
        tickRunnable?.let { handler.removeCallbacks(it) }
        super.onDestroy()
    }

    /** Slow opacity pulse on the "Adhan Playing" badge so it reads as a live indicator. */
    private fun pulseAdhanBadge() {
        val badge = findViewById<LinearLayout>(R.id.badgeAdhanPlaying)
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
