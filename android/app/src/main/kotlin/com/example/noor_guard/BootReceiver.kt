package com.example.noor_guard

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent

/** Restarts the prayer keep-alive foreground service after a reboot, if it was running before. */
class BootReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent) {
        when (intent.action) {
            Intent.ACTION_BOOT_COMPLETED,
            "android.intent.action.QUICKBOOT_POWERON",
            "com.htc.intent.action.QUICKBOOT_POWERON" -> PrayerForegroundService.restartIfEnabled(context)
        }
    }
}
