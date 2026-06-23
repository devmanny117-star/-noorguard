package com.noorguard.app

import android.content.Context
import android.content.SharedPreferences

/**
 * Native-only store for App Blocking config, written by [MainActivity] from
 * Dart's `AppBlockingService.syncToNative` and read by
 * [AppBlockerAccessibilityService] / [BlockActivity]. Deliberately its own
 * SharedPreferences file (not Flutter's `shared_preferences` plugin file) —
 * the same separation the existing `prayer_alarm_marks` prefs use.
 */
class AppBlockingStore(context: Context) {
    private val prefs: SharedPreferences =
        context.getSharedPreferences("app_blocking_config", Context.MODE_PRIVATE)

    data class Window(val prayerName: String, val startEpochMillis: Long, val endEpochMillis: Long)

    val enabled: Boolean get() = prefs.getBoolean("enabled", false)
    val mode: String get() = prefs.getString("mode", "firm") ?: "firm"
    val blockedPackages: Set<String>
        get() = prefs.getStringSet("blocked_packages", emptySet()) ?: emptySet()
    val locale: String get() = prefs.getString("locale", "en") ?: "en"

    val strings: Map<String, String>
        get() = STRING_KEYS.associateWith { prefs.getString(it, "") ?: "" }

    /** Null when no Focus Mode session is running. Set/cleared by Dart via
     * MainActivity.updateFocusSession, and cleared natively when the user
     * taps "End Focus Session" on the focus block screen. */
    var focusSessionEndMillis: Long?
        get() = prefs.getLong("focus_session_end", 0L).takeIf { it > 0L }
        set(value) {
            val editor = prefs.edit()
            if (value == null) editor.remove("focus_session_end") else editor.putLong("focus_session_end", value)
            editor.apply()
        }

    /** Focus Mode's own blocked-apps list — independent of [blockedPackages]
     * (the prayer-time list). Always re-pushed fresh whenever a session
     * starts, so this never needs syncing outside of that. */
    var focusBlockedPackages: Set<String>
        get() = prefs.getStringSet("focus_blocked_packages", emptySet()) ?: emptySet()
        set(value) = prefs.edit().putStringSet("focus_blocked_packages", value).apply()

    fun clearFocusSession() {
        focusSessionEndMillis = null
    }

    /** Null when no manual "Test App Blocking" window is running — set by
     * Dart via MainActivity.startTestBlockWindow (App Blocking settings
     * screen's test button), for verifying the real prayer-block pathway
     * on-device without waiting for an actual prayer time. Uses an empty
     * prayer name (see activeBlockSource) so BlockActivity's "I Prayed"
     * never writes a fake entry into the real streak-tracking prefs. */
    var testWindowEndMillis: Long?
        get() = prefs.getLong("test_window_end", 0L).takeIf { it > 0L }
        set(value) {
            val editor = prefs.edit()
            if (value == null) editor.remove("test_window_end") else editor.putLong("test_window_end", value)
            editor.apply()
        }

    sealed class BlockSource {
        data class Prayer(val window: Window) : BlockSource()
        data class Focus(val endMillis: Long) : BlockSource()
    }

    /** Single decision point for "what, if anything, should block right now" —
     * a manual test window or real prayer window outranks a running focus
     * session, and a focus session is checked regardless of the [enabled]
     * (prayer auto-blocking) toggle, since starting a session is its own
     * explicit user action — same for a test window, which fires
     * regardless of [enabled] since it's an explicit one-off check too. */
    fun activeBlockSource(prayerBlockingEnabled: Boolean, nowMillis: Long = System.currentTimeMillis()): BlockSource? {
        val testEnd = testWindowEndMillis
        if (testEnd != null) {
            if (testEnd > nowMillis) return BlockSource.Prayer(Window("", nowMillis, testEnd))
            testWindowEndMillis = null
        }
        if (prayerBlockingEnabled) {
            activeWindow(nowMillis)?.let { return BlockSource.Prayer(it) }
        }
        val focusEnd = focusSessionEndMillis
        if (focusEnd != null && focusEnd > nowMillis) return BlockSource.Focus(focusEnd)
        return null
    }

    private fun windows(): List<Window> {
        val raw = prefs.getString("windows", "") ?: ""
        if (raw.isBlank()) return emptyList()
        return raw.split(";").mapNotNull { entry ->
            val parts = entry.split(",")
            if (parts.size != 3) return@mapNotNull null
            val start = parts[1].toLongOrNull() ?: return@mapNotNull null
            val end = parts[2].toLongOrNull() ?: return@mapNotNull null
            Window(parts[0], start, end)
        }
    }

    fun activeWindow(nowMillis: Long = System.currentTimeMillis()): Window? =
        windows().firstOrNull { nowMillis in it.startEpochMillis..it.endEpochMillis }

    /** Time-based — stays bypassed until [untilMillis] (the rest of the
     *  current window/session). Reserved for Emergency Bypass, where the
     *  user may genuinely need more than one re-entry. */
    fun isBypassed(pkg: String): Boolean =
        prefs.getLong("bypass_until_$pkg", 0L) > System.currentTimeMillis()

    fun grantBypassUntil(pkg: String, untilMillis: Long) {
        prefs.edit()
            .putLong("bypass_until_$pkg", untilMillis)
            .apply()
    }

    /** Single-use — lets exactly one re-entry into [pkg] through, then
     *  clears itself. Used by "I Prayed" / "Read 3 Ayahs": the user gets
     *  back to the one app they were already in, but leaving and reopening
     *  it blocks again — unlike [grantBypassUntil]'s window/session-long
     *  pass. */
    fun grantSingleUseBypass(pkg: String) {
        prefs.edit().putBoolean("bypass_once_$pkg", true).apply()
    }

    fun consumeSingleUseBypass(pkg: String): Boolean {
        if (!prefs.getBoolean("bypass_once_$pkg", false)) return false
        prefs.edit().remove("bypass_once_$pkg").apply()
        return true
    }

    /** Once per active window per package, so Soft mode nags only once, not on every glance. */
    fun shouldShowSoftReminder(pkg: String, windowStart: Long): Boolean {
        val last = prefs.getLong("soft_reminder_shown_$pkg", 0L)
        return last < windowStart
    }

    fun markSoftReminderShown(pkg: String) {
        prefs.edit().putLong("soft_reminder_shown_$pkg", System.currentTimeMillis()).apply()
    }

    fun write(
        enabled: Boolean,
        mode: String,
        blockedPackages: List<String>,
        windowsSerialized: String,
        locale: String,
        strings: Map<String, String>,
    ) {
        val editor = prefs.edit()
        editor.putBoolean("enabled", enabled)
        editor.putString("mode", mode)
        editor.putStringSet("blocked_packages", blockedPackages.toSet())
        editor.putString("windows", windowsSerialized)
        editor.putString("locale", locale)
        for (key in STRING_KEYS) {
            editor.putString(key, strings[key] ?: "")
        }
        editor.apply()
    }

    companion object {
        val STRING_KEYS = listOf(
            "headline1", "headline2", "iPrayed", "readAyahs", "emergencyBypass",
            "bypassConfirmTitle", "bypassConfirmBody", "bypassConfirmContinue", "bypassConfirmCancel",
            "softReminderTitle", "softReminderBody",
            "focusHeadline1", "focusHeadline2", "endFocusSession",
        )
    }
}
