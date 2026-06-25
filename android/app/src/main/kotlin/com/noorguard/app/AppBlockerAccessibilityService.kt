package com.noorguard.app

import android.accessibilityservice.AccessibilityService
import android.app.ActivityOptions
import android.app.NotificationChannel
import android.app.NotificationManager
import android.content.Intent
import android.os.Build
import android.util.Log
import android.view.accessibility.AccessibilityEvent
import androidx.core.app.NotificationCompat

/**
 * Watches for foreground app changes. When a package opens, decides what (if
 * anything) should block it via [AppBlockingStore.activeBlockSource] — a
 * prayer block window outranks a running Focus Mode session, which is why
 * prayer and focus can never both show a block screen at once. Each source
 * has its *own* blocked-apps list (App Blocking's prayer-time list vs. Focus
 * Mode's own list), so package membership is only checked once the source is
 * known, against that source's list — not a single shared list. Soft mode
 * only applies to the prayer path; a focus session always shows the full
 * block screen. All config and copy come from [AppBlockingStore] — this
 * service never talks to Dart directly.
 */
class AppBlockerAccessibilityService : AccessibilityService() {

    companion object {
        private const val TAG = "AppBlocker"
    }

    /** Fires once when the system binds this long-running service — at boot,
     *  or whenever the user (re)enables it in Settings — long before any
     *  blocked app actually opens. The ideal moment to start warming
     *  [BlockScreenCache] on a background thread. */
    override fun onServiceConnected() {
        super.onServiceConnected()
        BlockScreenCache.warm(applicationContext)
    }

    override fun onAccessibilityEvent(event: AccessibilityEvent) {
        if (event.eventType != AccessibilityEvent.TYPE_WINDOW_STATE_CHANGED) return
        val pkg = event.packageName?.toString() ?: return
        if (pkg == packageName) return

        val store = AppBlockingStore(this)

        if (store.consumeSingleUseBypass(pkg)) {
            Log.d(TAG, "$pkg: consumed single-use bypass, letting through")
            return
        }
        if (store.isBypassed(pkg)) {
            Log.d(TAG, "$pkg: timed bypass still active, letting through")
            return
        }

        val source = store.activeBlockSource(prayerBlockingEnabled = store.enabled)
        Log.d(TAG, "$pkg: mode=${store.mode} enabled=${store.enabled} source=$source")

        when (source) {
            is AppBlockingStore.BlockSource.Prayer -> {
                if (!store.blockedPackages.contains(pkg)) {
                    Log.d(TAG, "$pkg: not in blockedPackages, ignoring")
                    return
                }
                if (store.mode == "soft") {
                    Log.d(TAG, "$pkg: soft mode, showing reminder notification")
                    showSoftReminder(store, pkg, source.window.startEpochMillis)
                } else {
                    Log.d(TAG, "$pkg: mode=${store.mode}, launching BlockActivity")
                    launchBlockActivity(pkg, "prayer", source.window.prayerName, source.window.endEpochMillis)
                }
            }
            is AppBlockingStore.BlockSource.Focus -> {
                if (!store.focusBlockedPackages.contains(pkg)) {
                    Log.d(TAG, "$pkg: not in focusBlockedPackages, ignoring")
                    return
                }
                Log.d(TAG, "$pkg: focus source, launching BlockActivity")
                launchBlockActivity(pkg, "focus", "", source.endMillis)
            }
            null -> {
                Log.d(TAG, "$pkg: no active block source, ignoring")
                return
            }
        }
    }

    private fun launchBlockActivity(pkg: String, source: String, prayerName: String, windowEndMillis: Long) {
        val intent = Intent(this, BlockActivity::class.java).apply {
            addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            putExtra(BlockActivity.EXTRA_BLOCKED_PACKAGE, pkg)
            putExtra(BlockActivity.EXTRA_SOURCE, source)
            putExtra(BlockActivity.EXTRA_PRAYER_NAME, prayerName)
            putExtra(BlockActivity.EXTRA_WINDOW_END_MILLIS, windowEndMillis)
        }
        Log.d(TAG, "$pkg: starting BlockActivity (source=$source)")
        // Zero-duration transition — the default cross-task open animation
        // (~300ms) is exactly the kind of perceived delay this screen needs
        // to avoid; BlockActivity should just appear.
        val options = ActivityOptions.makeCustomAnimation(this, 0, 0)
        startActivity(intent, options.toBundle())
    }

    private fun showSoftReminder(store: AppBlockingStore, pkg: String, windowStart: Long) {
        if (!store.shouldShowSoftReminder(pkg, windowStart)) return
        val channelId = "app_blocking_soft_reminder"
        val notifManager = getSystemService(NOTIFICATION_SERVICE) as NotificationManager
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            notifManager.createNotificationChannel(
                NotificationChannel(
                    channelId,
                    "Prayer Time Reminders",
                    NotificationManager.IMPORTANCE_DEFAULT,
                )
            )
        }
        val strings = store.strings
        val notification = NotificationCompat.Builder(this, channelId)
            .setSmallIcon(R.mipmap.ic_launcher)
            .setContentTitle(strings["softReminderTitle"])
            .setContentText(strings["softReminderBody"])
            .setAutoCancel(true)
            .build()
        notifManager.notify(9100, notification)
        store.markSoftReminderShown(pkg)
    }

    override fun onInterrupt() {}
}
