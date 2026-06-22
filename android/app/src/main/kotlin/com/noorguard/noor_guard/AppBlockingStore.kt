package com.noorguard.noor_guard

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

    fun isBypassed(pkg: String): Boolean =
        prefs.getLong("bypass_until_$pkg", 0L) > System.currentTimeMillis()

    fun grantBypassUntil(pkg: String, untilMillis: Long) {
        prefs.edit()
            .putLong("bypass_until_$pkg", untilMillis)
            .apply()
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
        )
    }
}
