package com.example.noor_guard

import android.app.Activity
import android.app.KeyguardManager
import android.app.NotificationManager
import android.content.Context
import android.os.Build
import android.os.Bundle
import android.view.Gravity
import android.view.View
import android.view.WindowManager
import android.widget.ImageView
import android.widget.LinearLayout
import android.widget.TextView
import androidx.core.content.ContextCompat

class PrayerAlarmActivity : Activity() {

    private data class ScheduleEntry(val name: String, val timeStr: String, val epochMillis: Long)

    override fun onCreate(savedInstanceState: Bundle?) {
        showOverLockScreen()
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_prayer_alarm)

        val prayerName = intent.getStringExtra(PrayerAlarmReceiver.EXTRA_PRAYER_NAME) ?: "Prayer"
        val arabicName = intent.getStringExtra(PrayerAlarmReceiver.EXTRA_PRAYER_ARABIC) ?: ""
        val prayerTime = intent.getStringExtra(PrayerAlarmReceiver.EXTRA_PRAYER_TIME) ?: ""
        val message = intent.getStringExtra(PrayerAlarmReceiver.EXTRA_PRAYER_MESSAGE) ?: ""
        val notifId = intent.getIntExtra(PrayerAlarmReceiver.EXTRA_NOTIFICATION_ID, 100)
        val schedule = parseSchedule(intent.getStringExtra(PrayerAlarmReceiver.EXTRA_ALL_PRAYERS))

        findViewById<ImageView>(R.id.imageHero).setImageResource(heroImageFor(prayerName))
        findViewById<TextView>(R.id.textPrayerName).text = prayerName
        findViewById<TextView>(R.id.textPrayerArabic).text = arabicName
        findViewById<TextView>(R.id.textPrayerTime).text = prayerTime
        findViewById<TextView>(R.id.textMessage).text = message

        bindPrayerPills(schedule, currentName = prayerName)

        findViewById<TextView>(R.id.btnIPrayed).setOnClickListener {
            markPrayer(prayerName)
            dismissAlarm(notifId)
        }

        findViewById<TextView>(R.id.btnDismiss).setOnClickListener {
            dismissAlarm(notifId)
        }
    }

    /** Maps a prayer name to its time-of-day-appropriate hero photo, falling back for unknown names (e.g. the test alarm). */
    private fun heroImageFor(prayerName: String): Int = when (prayerName) {
        "Fajr" -> R.drawable.img_hero_fajr
        "Dhuhr" -> R.drawable.img_hero_dhuhr
        "Asr" -> R.drawable.img_hero_asr
        "Maghrib" -> R.drawable.img_hero_maghrib
        "Isha" -> R.drawable.img_hero_isha
        else -> R.drawable.img_hero_asr
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

    private fun bindPrayerPills(schedule: List<ScheduleEntry>, currentName: String) {
        val row = findViewById<LinearLayout>(R.id.prayerPillsRow)
        if (schedule.isEmpty()) {
            row.visibility = View.GONE
            return
        }
        for (entry in schedule) {
            row.addView(buildPillView(entry, isCurrent = entry.name == currentName))
        }
    }

    /**
     * Builds one prayer pill plus its own current-prayer dot indicator
     * underneath, wrapped together so the pair distributes evenly across
     * the row. The dot is reserved (INVISIBLE, not GONE) on every other
     * pill so all 5 line up at the same height regardless of which fired.
     */
    private fun buildPillView(entry: ScheduleEntry, isCurrent: Boolean): LinearLayout {
        val density = resources.displayMetrics.density
        fun dp(value: Int) = (value * density).toInt()

        val wrapper = LinearLayout(this).apply {
            orientation = LinearLayout.VERTICAL
            gravity = Gravity.CENTER
            layoutParams = LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f).also {
                it.marginStart = dp(3)
                it.marginEnd = dp(3)
            }
        }

        val pill = LinearLayout(this).apply {
            orientation = LinearLayout.VERTICAL
            gravity = Gravity.CENTER
            layoutParams = LinearLayout.LayoutParams(
                LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.WRAP_CONTENT
            )
            setPadding(dp(2), dp(10), dp(2), dp(10))
            background = ContextCompat.getDrawable(
                this@PrayerAlarmActivity,
                if (isCurrent) R.drawable.bg_pill_current else R.drawable.bg_pill_outline
            )
        }

        // Gold is reserved for the current prayer; every other pill stays a
        // dimmed cream so the highlight reads clearly at a glance.
        val textColor = ContextCompat.getColor(
            this, if (isCurrent) R.color.navy else R.color.cream
        )

        pill.addView(TextView(this).apply {
            text = prayerEmoji(entry.name)
            textSize = 15f
            gravity = Gravity.CENTER
        })
        pill.addView(TextView(this).apply {
            text = entry.name
            setTextColor(textColor)
            textSize = 11f
            gravity = Gravity.CENTER
            setPadding(0, dp(4), 0, 0)
        })
        pill.addView(TextView(this).apply {
            text = entry.timeStr.replace(" AM", "").replace(" PM", "")
            setTextColor(textColor)
            textSize = 10f
            gravity = Gravity.CENTER
            alpha = if (isCurrent) 1f else 0.75f
        })

        wrapper.addView(pill)
        wrapper.addView(View(this).apply {
            layoutParams = LinearLayout.LayoutParams(dp(6), dp(6)).also {
                it.topMargin = dp(6)
            }
            background = ContextCompat.getDrawable(this@PrayerAlarmActivity, R.drawable.bg_dot_gold)
            visibility = if (isCurrent) View.VISIBLE else View.INVISIBLE
        })

        return wrapper
    }

    private fun prayerEmoji(name: String) = when (name) {
        "Fajr" -> "🌅"
        "Dhuhr" -> "☀️"
        "Asr" -> "🌤️"
        "Maghrib" -> "🌇"
        "Isha" -> "🌙"
        else -> "🕓"
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
