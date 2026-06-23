package com.noorguard.app

import android.animation.ObjectAnimator
import android.app.Activity
import android.app.AlertDialog
import android.content.Intent
import android.os.Bundle
import android.view.View
import android.widget.TextView
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

    private val isFocusSource get() = source == SOURCE_FOCUS

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_block_screen)

        store = AppBlockingStore(this)
        blockedPackage = intent.getStringExtra(EXTRA_BLOCKED_PACKAGE) ?: run { finish(); return }
        source = intent.getStringExtra(EXTRA_SOURCE) ?: SOURCE_PRAYER
        prayerName = intent.getStringExtra(EXTRA_PRAYER_NAME) ?: ""
        windowEndMillis = intent.getLongExtra(EXTRA_WINDOW_END_MILLIS, System.currentTimeMillis())

        val strings = store.strings
        bindHeadline(strings)
        bindVerse()
        bindButtons(strings)
        startCrescentPulse()
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
            typeface = ResourcesCompat.getFont(this@BlockActivity, R.font.scheherazade_new)
        }
        findViewById<TextView>(R.id.textVerseTranslation).text =
            verse.translations[store.locale] ?: verse.translations["en"] ?: ""
        findViewById<TextView>(R.id.textVerseReference).text = verse.reference.uppercase(Locale.getDefault())
    }

    private fun bindButtons(strings: Map<String, String>) {
        findViewById<TextView>(R.id.btnIPrayed).apply {
            text = if (isFocusSource) strings["endFocusSession"] else strings["iPrayed"]
            setOnClickListener { if (isFocusSource) onEndFocusSession() else onIPrayed() }
        }
        findViewById<TextView>(R.id.btnReadAyahs).apply {
            text = strings["readAyahs"]
            setOnClickListener { onReadAyahs() }
        }
        findViewById<TextView>(R.id.btnEmergencyBypass).apply {
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

    private data class Verse(val reference: String, val arabic: String, val translations: Map<String, String>)

    private fun loadRandomVerse(): Verse? {
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
            Verse(
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
        }
    }
}
