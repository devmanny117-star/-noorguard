package com.noorguard.app.widget

import android.content.Context
import android.content.Intent
import androidx.glance.GlanceId
import androidx.glance.action.ActionParameters
import androidx.glance.appwidget.action.ActionCallback
import com.noorguard.app.MainActivity
import com.noorguard.app.PrayerForegroundService

/**
 * Opens MainActivity deep-linked to the Large widget's daily-verse ayah when
 * that section is tapped — reuses the exact nav-extras contract the Noor
 * Guard Live notification already uses (see
 * PrayerForegroundService.buildNotification), so
 * MainActivity.getPendingNotificationNav / Dart's NotificationNavService
 * route it to the Quran reader with no widget-specific handling needed on
 * the Dart side.
 */
class OpenAyahActionCallback : ActionCallback {
    companion object {
        val SurahKey = ActionParameters.Key<Int>("surah")
        val AyahKey = ActionParameters.Key<Int>("ayah")
    }

    override suspend fun onAction(
        context: Context,
        glanceId: GlanceId,
        parameters: ActionParameters,
    ) {
        val surah = parameters[SurahKey] ?: return
        val ayah = parameters[AyahKey] ?: return
        val intent = Intent(context, MainActivity::class.java).apply {
            flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_SINGLE_TOP
            putExtra(PrayerForegroundService.EXTRA_NAV_TYPE, "ayah")
            putExtra(PrayerForegroundService.EXTRA_NAV_DATA, "$surah:$ayah")
        }
        context.startActivity(intent)
    }
}
