package com.noorguard.noor_guard

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent

/// Receives the STOP_ADHAN broadcast sent by the silent prayer banner's
/// contentIntent (tap) and deleteIntent (swipe-dismiss), then signals the
/// Flutter engine to stop the in-app adhan via the adhan_control channel.
class AdhanStopReceiver : BroadcastReceiver() {

    companion object {
        const val ACTION_STOP_ADHAN = "com.noorguard.noor_guard.STOP_ADHAN"
    }

    override fun onReceive(context: Context, intent: Intent) {
        if (intent.action == ACTION_STOP_ADHAN) {
            // onReceive runs on the Android main thread, which is also Flutter's
            // platform thread, so invokeMethod is safe to call directly here.
            MainActivity.adhanChannel?.invokeMethod("stopAdhan", null)
        }
    }
}
