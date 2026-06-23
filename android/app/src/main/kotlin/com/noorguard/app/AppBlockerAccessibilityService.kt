package com.noorguard.app

import android.accessibilityservice.AccessibilityService
import android.app.NotificationChannel
import android.app.NotificationManager
import android.content.Intent
import android.os.Build
import android.view.accessibility.AccessibilityEvent
import androidx.core.app.NotificationCompat

/**
 * Watches for foreground app changes. When a blocked app opens, decides what
 * (if anything) should block it via [AppBlockingStore.activeBlockSource] —
 * a prayer block window outranks a running Focus Mode session, which is why
 * prayer and focus can never both show a block screen at once. Soft mode
 * only applies to the prayer path; a focus session always shows the full
 * block screen. All config and copy come from [AppBlockingStore] — this
 * service never talks to Dart directly.
 */
class AppBlockerAccessibilityService : AccessibilityService() {

    override fun onAccessibilityEvent(event: AccessibilityEvent) {
        if (event.eventType != AccessibilityEvent.TYPE_WINDOW_STATE_CHANGED) return
        val pkg = event.packageName?.toString() ?: return
        if (pkg == packageName) return

        val store = AppBlockingStore(this)
        if (!store.blockedPackages.contains(pkg)) return
        if (store.isBypassed(pkg)) return

        when (val source = store.activeBlockSource(prayerBlockingEnabled = store.enabled)) {
            is AppBlockingStore.BlockSource.Prayer -> {
                if (store.mode == "soft") {
                    showSoftReminder(store, pkg, source.window.startEpochMillis)
                } else {
                    launchBlockActivity(pkg, "prayer", source.window.prayerName, source.window.endEpochMillis)
                }
            }
            is AppBlockingStore.BlockSource.Focus -> {
                launchBlockActivity(pkg, "focus", "", source.endMillis)
            }
            null -> return
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
        startActivity(intent)
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
