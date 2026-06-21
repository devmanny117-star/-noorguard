package com.example.noor_guard

import android.animation.Animator
import android.animation.ObjectAnimator
import android.animation.PropertyValuesHolder
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
import android.view.animation.AccelerateDecelerateInterpolator
import android.widget.ImageView
import android.widget.LinearLayout
import android.widget.TextView
import androidx.core.content.ContextCompat
import androidx.core.content.res.ResourcesCompat
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale

class PrayerAlarmActivity : Activity() {

    private data class ScheduleEntry(val name: String, val timeStr: String, val epochMillis: Long)

    /** Every looping animator started in onCreate, so onDestroy can cancel them all cleanly. */
    private val runningAnimators = mutableListOf<Animator>()

    override fun onCreate(savedInstanceState: Bundle?) {
        showOverLockScreen()
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_prayer_alarm)
        findViewById<View>(R.id.rootContent).alpha = 0f

        val prayerName = intent.getStringExtra(PrayerAlarmReceiver.EXTRA_PRAYER_NAME) ?: "Prayer"
        val arabicName = intent.getStringExtra(PrayerAlarmReceiver.EXTRA_PRAYER_ARABIC) ?: ""
        val prayerTime = intent.getStringExtra(PrayerAlarmReceiver.EXTRA_PRAYER_TIME) ?: ""
        val message = intent.getStringExtra(PrayerAlarmReceiver.EXTRA_PRAYER_MESSAGE) ?: ""
        val notifId = intent.getIntExtra(PrayerAlarmReceiver.EXTRA_NOTIFICATION_ID, 100)
        val schedule = parseSchedule(intent.getStringExtra(PrayerAlarmReceiver.EXTRA_ALL_PRAYERS))

        findViewById<TextView>(R.id.textDate).text =
            SimpleDateFormat("EEEE, MMMM d", Locale.getDefault()).format(Date()).uppercase(Locale.getDefault())

        findViewById<ImageView>(R.id.imageHero).setImageResource(heroImageFor(prayerName))
        findViewById<TextView>(R.id.textPrayerName).apply {
            text = prayerName
            // Soft outer glow behind the name — a shadow with no offset spreads
            // symmetrically outward from the glyphs, reading as a shimmer.
            setShadowLayer(28f, 0f, 0f, ContextCompat.getColor(this@PrayerAlarmActivity, R.color.gold))
        }
        findViewById<TextView>(R.id.textPrayerArabic).apply {
            text = arabicName
            typeface = ResourcesCompat.getFont(this@PrayerAlarmActivity, R.font.scheherazade_new)
        }
        findViewById<TextView>(R.id.textPrayerTime).text = prayerTime
        findViewById<TextView>(R.id.textMessage).text = message

        bindPrayerPills(schedule, currentName = prayerName)

        findViewById<TextView>(R.id.btnIPrayed).setOnClickListener { view ->
            markPrayer(prayerName)
            burstConfetti(view)
            Handler(Looper.getMainLooper()).postDelayed({ dismissAlarm(notifId) }, 700L)
        }

        findViewById<TextView>(R.id.btnDismiss).setOnClickListener {
            dismissAlarm(notifId)
        }

        startKenBurnsEffect()
        startCrescentPulse()
        startSoundWaveAnimation()
        findViewById<View>(R.id.rootContent).animate().alpha(1f).setDuration(450).start()
    }

    override fun onDestroy() {
        for (animator in runningAnimators) animator.cancel()
        runningAnimators.clear()
        findViewById<ParticleView>(R.id.particleView).stop()
        findViewById<ConfettiView>(R.id.confettiView).cancel()
        super.onDestroy()
    }

    /**
     * Subtle cinematic zoom on the hero photo — scale 1.0 to 1.15 over 12
     * seconds, then back out, forever. Centered pivot (the View default), so
     * it reads as a slow zoom rather than a pan.
     */
    private fun startKenBurnsEffect() {
        val hero = findViewById<ImageView>(R.id.imageHero)
        val animator = ObjectAnimator.ofPropertyValuesHolder(
            hero,
            PropertyValuesHolder.ofFloat(View.SCALE_X, 1f, 1.15f),
            PropertyValuesHolder.ofFloat(View.SCALE_Y, 1f, 1.15f),
        ).apply {
            duration = 12_000L
            interpolator = AccelerateDecelerateInterpolator()
            repeatMode = ObjectAnimator.REVERSE
            repeatCount = ObjectAnimator.INFINITE
        }
        animator.start()
        runningAnimators.add(animator)
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
     *
     * Styled to match the home screen's prayer pills exactly: dark card
     * background, gold fill on the highlighted pill, and a small green dot
     * before the time.
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

        val nameColor = ContextCompat.getColor(
            this, if (isCurrent) R.color.navy else android.R.color.white
        )
        val timeColor = ContextCompat.getColor(
            this, if (isCurrent) R.color.navy else R.color.gold
        )
        val scheherazade = ResourcesCompat.getFont(this, R.font.scheherazade_new)

        pill.addView(TextView(this).apply {
            text = prayerArabicName(entry.name)
            typeface = scheherazade
            setTextColor(ContextCompat.getColor(this@PrayerAlarmActivity, R.color.gold))
            textSize = 15f
            gravity = Gravity.CENTER
        })
        pill.addView(TextView(this).apply {
            text = entry.name
            setTextColor(nameColor)
            textSize = 11f
            gravity = Gravity.CENTER
            setPadding(0, dp(4), 0, 0)
        })
        pill.addView(LinearLayout(this).apply {
            orientation = LinearLayout.HORIZONTAL
            gravity = Gravity.CENTER
            setPadding(0, dp(3), 0, 0)
            addView(View(this@PrayerAlarmActivity).apply {
                layoutParams = LinearLayout.LayoutParams(dp(5), dp(5)).also { it.marginEnd = dp(4) }
                background = ContextCompat.getDrawable(this@PrayerAlarmActivity, R.drawable.bg_dot_green)
            })
            addView(TextView(this@PrayerAlarmActivity).apply {
                text = entry.timeStr.replace(" AM", "").replace(" PM", "")
                setTextColor(timeColor)
                textSize = 10f
            })
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

    private fun prayerArabicName(name: String) = when (name) {
        "Fajr" -> "الفجر"
        "Dhuhr" -> "الظهر"
        "Asr" -> "العصر"
        "Maghrib" -> "المغرب"
        "Isha" -> "العشاء"
        else -> ""
    }

    /** Gentle breathing pulse on the crescent's glow — scale and alpha, reversing forever. */
    private fun startCrescentPulse() {
        val glow = findViewById<View>(R.id.crescentGlow)
        val animators = listOf(
            ObjectAnimator.ofFloat(glow, View.SCALE_X, 1f, 1.25f),
            ObjectAnimator.ofFloat(glow, View.SCALE_Y, 1f, 1.25f),
            ObjectAnimator.ofFloat(glow, View.ALPHA, 0.6f, 1f),
        )
        for (animator in animators) {
            animator.duration = 1400
            animator.repeatMode = ObjectAnimator.REVERSE
            animator.repeatCount = ObjectAnimator.INFINITE
            animator.start()
            runningAnimators.add(animator)
        }
    }

    /** Staggered equalizer-style bars for the "Adhan Playing" badge, each growing from its bottom edge. */
    private fun startSoundWaveAnimation() {
        val barHeightPx = 14 * resources.displayMetrics.density
        val bars = listOf(
            R.id.soundBar1 to Pair(0L, 420L),
            R.id.soundBar2 to Pair(140L, 520L),
            R.id.soundBar3 to Pair(260L, 360L),
            R.id.soundBar4 to Pair(90L, 480L),
        )
        for ((id, timing) in bars) {
            val (delay, durationMs) = timing
            val bar = findViewById<View>(id)
            bar.pivotY = barHeightPx
            val animator = ObjectAnimator.ofFloat(bar, View.SCALE_Y, 0.3f, 1f).apply {
                duration = durationMs
                startDelay = delay
                repeatMode = ObjectAnimator.REVERSE
                repeatCount = ObjectAnimator.INFINITE
            }
            animator.start()
            runningAnimators.add(animator)
        }
    }

    /** Bursts confetti from [anchor]'s center, in the shared ConfettiView's own coordinate space. */
    private fun burstConfetti(anchor: View) {
        val confetti = findViewById<ConfettiView>(R.id.confettiView)
        val anchorLocation = IntArray(2)
        anchor.getLocationOnScreen(anchorLocation)
        val confettiLocation = IntArray(2)
        confetti.getLocationOnScreen(confettiLocation)
        val originX = (anchorLocation[0] - confettiLocation[0] + anchor.width / 2).toFloat()
        val originY = (anchorLocation[1] - confettiLocation[1]).toFloat()
        confetti.burst(originX, originY)
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
