package com.noorguard.app

import android.animation.Animator
import android.animation.ObjectAnimator
import android.animation.PropertyValuesHolder
import android.app.Activity
import android.app.AlertDialog
import android.content.Intent
import android.graphics.drawable.GradientDrawable
import android.os.Bundle
import android.view.View
import android.view.animation.AccelerateDecelerateInterpolator
import android.widget.ImageView
import android.widget.LinearLayout
import android.widget.TextView
import androidx.core.content.ContextCompat
import androidx.core.content.res.ResourcesCompat
import org.json.JSONObject
import java.io.BufferedReader
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale

/**
 * Full-screen Islamic block screen shown over a blocked app, either during an
 * active prayer block window or a running Focus Mode session ([EXTRA_SOURCE]
 * — "prayer" or "focus") — never both, since [AppBlockingStore.activeBlockSource]
 * is the single decision point that picked one. Plain Activity with a native
 * XML layout — not a second Flutter engine — matching [PrayerAlarmActivity]'s
 * existing pattern for instant, reliable full-screen takeover UI.
 */
class BlockActivity : Activity() {

    companion object {
        const val EXTRA_BLOCKED_PACKAGE = "blocked_package"
        const val EXTRA_SOURCE = "source"
        const val SOURCE_PRAYER = "prayer"
        const val SOURCE_FOCUS = "focus"
        const val EXTRA_PRAYER_NAME = "prayer_name"
        const val EXTRA_WINDOW_END_MILLIS = "window_end_millis"
        const val EXTRA_AYAH_CHALLENGE = "ayah_challenge"
    }

    private lateinit var store: AppBlockingStore
    private var blockedPackage: String = ""
    private var source: String = SOURCE_PRAYER
    private var prayerName: String = ""
    private var windowEndMillis: Long = 0L

    /** Every looping animator started in onCreate, so onDestroy can cancel them all cleanly. */
    private val runningAnimators = mutableListOf<Animator>()

    private val isFocusSource get() = source == SOURCE_FOCUS

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // No-op past the very first call in the process — real warm-up
        // happens much earlier, from AppBlockerAccessibilityService.onServiceConnected.
        // This is just a defensive fallback for that one-in-a-million race.
        BlockScreenCache.warm(this)
        setContentView(R.layout.activity_block_screen)
        findViewById<View>(R.id.rootContent).alpha = 0f

        store = AppBlockingStore(this)
        blockedPackage = intent.getStringExtra(EXTRA_BLOCKED_PACKAGE) ?: run { finish(); return }
        source = intent.getStringExtra(EXTRA_SOURCE) ?: SOURCE_PRAYER
        prayerName = intent.getStringExtra(EXTRA_PRAYER_NAME) ?: ""
        windowEndMillis = intent.getLongExtra(EXTRA_WINDOW_END_MILLIS, System.currentTimeMillis())

        val strings = store.strings
        bindHero()
        bindBigTitle(strings)
        bindModeBadge(strings)
        bindHeadline(strings)
        bindVerse()
        bindButtons(strings)
        startCrescentPulse()
        findViewById<View>(R.id.rootContent).animate().alpha(1f).setDuration(450).start()
    }

    override fun onDestroy() {
        for (animator in runningAnimators) animator.cancel()
        runningAnimators.clear()
        findViewById<ParticleView>(R.id.particleView).stop()
        super.onDestroy()
    }

    /** Maps the prayer to its time-of-day hero photo, same images as
     *  PrayerAlarmActivity; focus sessions and test windows (blank prayer
     *  name) fall back to the night photo, matching this screen's navy/gold
     *  theme. */
    private fun heroImageFor(name: String): Int = when (name) {
        "Fajr" -> R.drawable.img_hero_fajr
        "Dhuhr" -> R.drawable.img_hero_dhuhr
        "Asr" -> R.drawable.img_hero_asr
        "Maghrib" -> R.drawable.img_hero_maghrib
        "Isha" -> R.drawable.img_hero_isha
        else -> R.drawable.img_hero_isha
    }

    private fun bindHero() {
        val hero = findViewById<ImageView>(R.id.imageHero)
        val drawableId = heroImageFor(prayerName)
        // Almost always already decoded by BlockScreenCache well before this
        // screen ever opens; setImageResource is just the cold-start fallback.
        val cached = BlockScreenCache.heroBitmap(drawableId)
        if (cached != null) hero.setImageBitmap(cached) else hero.setImageResource(drawableId)
        startKenBurnsEffect(hero)
    }

    /** Same slow cinematic zoom as PrayerAlarmActivity's hero photo. */
    private fun startKenBurnsEffect(hero: ImageView) {
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

    private fun bindBigTitle(strings: Map<String, String>) {
        val title = when {
            isFocusSource -> strings["focusModeTitle"]
            prayerName.isNotBlank() -> prayerName
            else -> strings["defaultTitle"]
        }
        findViewById<TextView>(R.id.textBigTitle).apply {
            text = title
            // Same soft outer-glow shimmer PrayerAlarmActivity puts behind its prayer name.
            setShadowLayer(28f, 0f, 0f, ContextCompat.getColor(this@BlockActivity, R.color.gold))
        }
    }

    /** Mode only applies to the prayer path (Soft never reaches this screen) —
     *  Focus sessions have no Soft/Firm/Hard concept, so the badge is hidden. */
    private fun bindModeBadge(strings: Map<String, String>) {
        val badge = findViewById<LinearLayout>(R.id.modeBadge)
        if (isFocusSource) {
            badge.visibility = View.GONE
            return
        }
        val (label, colorRes) = when (store.mode) {
            "soft" -> strings["modeSoft"] to R.color.mode_soft
            "hard" -> strings["modeHard"] to R.color.mode_hard
            else -> strings["modeFirm"] to R.color.mode_firm
        }
        val color = ContextCompat.getColor(this, colorRes)
        badge.visibility = View.VISIBLE
        (badge.background.mutate() as? GradientDrawable)?.setColor(color)
        findViewById<TextView>(R.id.textModeBadge).text = label?.uppercase(Locale.getDefault())
    }

    private fun bindHeadline(strings: Map<String, String>) {
        val (key1, key2) = if (isFocusSource) {
            "focusHeadline1" to "focusHeadline2"
        } else {
            "headline1" to "headline2"
        }
        val headline = if (System.currentTimeMillis() % 2 == 0L) strings[key1] else strings[key2]
        findViewById<TextView>(R.id.textHeadline).text = headline
    }

    private fun bindVerse() {
        val verse = loadRandomVerse() ?: return
        findViewById<TextView>(R.id.textVerseArabic).apply {
            text = verse.arabic
            typeface = BlockScreenCache.arabicTypeface
                ?: ResourcesCompat.getFont(this@BlockActivity, R.font.scheherazade_new)
        }
        findViewById<TextView>(R.id.textVerseTranslation).text =
            verse.translations[store.locale] ?: verse.translations["en"] ?: ""
        findViewById<TextView>(R.id.textVerseReference).text = verse.reference.uppercase(Locale.getDefault())
    }

    private fun bindButtons(strings: Map<String, String>) {
        val isHard = !isFocusSource && store.mode == "hard"
        // Firm mode (prayer path only) swaps the easy-to-miss emergency-bypass
        // link for a full-size, no-friction "Skip for now" button — that's the
        // whole distinction between Firm and Hard. Focus blocks and Hard mode
        // keep the original small link (Hard's still gated by a confirm dialog
        // in onEmergencyBypass).
        val useSkipButton = !isFocusSource && !isHard

        // Hard mode's only unlock path is "Read 3 Ayahs" — no "I Prayed" shortcut.
        findViewById<TextView>(R.id.btnIPrayed).apply {
            visibility = if (isHard) View.GONE else View.VISIBLE
            text = if (isFocusSource) strings["endFocusSession"] else strings["iPrayed"]
            setOnClickListener { if (isFocusSource) onEndFocusSession() else onIPrayed() }
        }

        // Firm mode hides this entirely ("Skip for now" covers it instead).
        // Focus and Hard both show it; Hard's gets the primary gold styling
        // since it's the only way through, instead of its usual outline look.
        findViewById<TextView>(R.id.btnReadAyahs).apply {
            visibility = if (isFocusSource || isHard) View.VISIBLE else View.GONE
            setBackgroundResource(if (isHard) R.drawable.bg_button_gold else R.drawable.bg_button_outline)
            setTextColor(ContextCompat.getColor(this@BlockActivity, if (isHard) R.color.navy else R.color.gold))
            text = strings["readAyahs"]
            setOnClickListener { onReadAyahs() }
        }

        findViewById<TextView>(R.id.btnSkipForNow).apply {
            visibility = if (useSkipButton) View.VISIBLE else View.GONE
            text = strings["skipForNow"]
            setOnClickListener { grantBypassAndFinish() }
        }
        findViewById<TextView>(R.id.btnEmergencyBypass).apply {
            visibility = if (useSkipButton) View.GONE else View.VISIBLE
            text = strings["emergencyBypass"]
            setOnClickListener { onEmergencyBypass(strings) }
        }
    }

    private fun onIPrayed() {
        if (prayerName.isNotBlank()) markPrayer(prayerName)
        // Single-use: lets the user back into this one app, but leaving and
        // reopening it blocks again for the rest of the window — marking
        // the prayer done doesn't unblock everything else for the day.
        store.grantSingleUseBypass(blockedPackage)
        finishAndRemoveTask()
    }

    /** Focus Mode's primary action — no prayer to mark and no bypass needed,
     *  since ending the session unblocks every app it was blocking. */
    private fun onEndFocusSession() {
        store.clearFocusSession()
        finishAndRemoveTask()
    }

    private fun onReadAyahs() {
        val launchIntent = Intent(this, MainActivity::class.java).apply {
            addFlags(Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_REORDER_TO_FRONT)
            putExtra(EXTRA_AYAH_CHALLENGE, true)
            putExtra(EXTRA_BLOCKED_PACKAGE, blockedPackage)
            putExtra(EXTRA_PRAYER_NAME, prayerName)
            putExtra(EXTRA_WINDOW_END_MILLIS, windowEndMillis)
        }
        startActivity(launchIntent)
        finish()
    }

    /** Always single-tap for Focus Mode (no streak at stake) — only the
     *  prayer path's Hard mode adds the confirm-dialog friction. */
    private fun onEmergencyBypass(strings: Map<String, String>) {
        if (!isFocusSource && store.mode == "hard") {
            AlertDialog.Builder(this)
                .setTitle(strings["bypassConfirmTitle"])
                .setMessage(strings["bypassConfirmBody"])
                .setPositiveButton(strings["bypassConfirmContinue"]) { _, _ -> grantBypassAndFinish() }
                .setNegativeButton(strings["bypassConfirmCancel"], null)
                .show()
        } else {
            grantBypassAndFinish()
        }
    }

    private fun grantBypassAndFinish() {
        store.grantBypassUntil(blockedPackage, windowEndMillis)
        finishAndRemoveTask()
    }

    /** Same `prayer_alarm_marks` prefs + key format PrayerAlarmActivity writes, so the
     *  home screen's existing pending-marks pickup (and StreakService) picks this up too. */
    private fun markPrayer(name: String) {
        val prefs = getSharedPreferences("prayer_alarm_marks", MODE_PRIVATE)
        val today = SimpleDateFormat("yyyy-MM-dd", Locale.US).format(Date())
        val existing = prefs.getStringSet("marked_$today", mutableSetOf()) ?: mutableSetOf()
        val updated = existing.toMutableSet()
        updated.add(name)
        prefs.edit().putStringSet("marked_$today", updated).apply()
    }

    /** Picks from [BlockScreenCache]'s pre-parsed pool (warmed long before
     *  this screen ever opens); only falls back to reading the JSON off disk
     *  here if that cache somehow came up empty. */
    private fun loadRandomVerse(): BlockScreenCache.Verse? =
        BlockScreenCache.randomVerse() ?: loadRandomVerseFromDisk()

    private fun loadRandomVerseFromDisk(): BlockScreenCache.Verse? {
        return try {
            val stream = assets.open("flutter_assets/assets/data/block_screen_verses.json")
            val json = stream.bufferedReader().use(BufferedReader::readText)
            val root = JSONObject(json)
            val versesArray = root.getJSONArray("verses")
            if (versesArray.length() == 0) return null
            val pick = versesArray.getJSONObject((0 until versesArray.length()).random())
            val translationsObj = pick.getJSONObject("translations")
            val translations = mutableMapOf<String, String>()
            for (key in translationsObj.keys()) {
                translations[key] = translationsObj.getString(key)
            }
            BlockScreenCache.Verse(
                reference = pick.getString("reference"),
                arabic = pick.getString("arabic"),
                translations = translations,
            )
        } catch (_: Exception) {
            null
        }
    }

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
}
