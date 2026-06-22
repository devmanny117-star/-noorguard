package com.noorguard.noor_guard

import android.accessibilityservice.AccessibilityService
import android.app.NotificationChannel
import android.app.NotificationManager
import android.content.Intent
import android.os.Build
import android.view.accessibility.AccessibilityEvent
import androidx.core.app.NotificationCompat

/**
 * Watches for foreground app changes and, when a blocked app opens during an
 * active prayer block window, either shows a gentle reminder (Soft mode) or
 * launches [BlockActivity] over it (Firm/Hard). All config and copy come
 * from [AppBlockingStore] — this service never talks to Dart directly.
 */
class AppBlockerAccessibilityService : AccessibilityService() {

    override fun onAccessibilityEvent(event: AccessibilityEvent) {
        if (event.eventType != AccessibilityEvent.TYPE_WINDOW_STATE_CHANGED) return
        val pkg = event.packageName?.toString() ?: return
        if (pkg == packageName) return

        val store = AppBlockingStore(this)
        if (!store.enabled) return
        if (!store.blockedPackages.contains(pkg)) return
        if (store.isBypassed(pkg)) return

        val window = store.activeWindow() ?: return

        if (store.mode == "soft") {
            showSoftReminder(store, pkg, window.startEpochMillis)
        } else {
            launchBlockActivity(pkg, window.prayerName, window.endEpochMillis)
        }
    }

    private fun launchBlockActivity(pkg: String, prayerName: String, windowEndMillis: Long) {
        val intent = Intent(this, BlockActivity::class.java).apply {
            addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            putExtra(BlockActivity.EXTRA_BLOCKED_PACKAGE, pkg)
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
