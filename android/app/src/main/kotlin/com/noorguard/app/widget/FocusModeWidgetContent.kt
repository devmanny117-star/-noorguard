package com.noorguard.app.widget

import android.content.Context
import androidx.compose.runtime.Composable
import androidx.compose.ui.unit.sp
import androidx.glance.GlanceModifier
import androidx.glance.action.clickable
import androidx.glance.layout.Alignment
import androidx.glance.layout.Box
import androidx.glance.layout.Column
import androidx.glance.layout.fillMaxSize
import androidx.glance.text.FontWeight
import androidx.glance.text.Text
import androidx.glance.text.TextStyle
import androidx.glance.unit.ColorProvider
import com.noorguard.app.MainActivity
import es.antonborri.home_widget.actionStartActivity

/** Swapped in for the normal prayer-times layout (Medium/Large widgets) while
 * a Focus Mode session is running — same outer [background], compact
 * timer + next-prayer-countdown content shared by both sizes. */
@Composable
fun FocusModeWidgetContent(context: Context, data: WidgetData, background: GlanceModifier) {
    Box(
        modifier = background.clickable(onClick = actionStartActivity<MainActivity>(context)),
    ) {
        Column(
            modifier = GlanceModifier.fillMaxSize(),
            horizontalAlignment = Alignment.Horizontal.CenterHorizontally,
        ) {
            Box(modifier = GlanceModifier.defaultWeight()) {}

            Text("🎯", style = TextStyle(fontSize = 30.sp))
            Text(
                data.labelFocusMode,
                style = TextStyle(
                    color = ColorProvider(WidgetTheme.gold),
                    fontSize = 15.sp,
                    fontWeight = FontWeight.Bold,
                ),
            )
            Text(
                data.focusRemainingLabel(),
                style = TextStyle(
                    color = ColorProvider(WidgetTheme.cream),
                    fontSize = 26.sp,
                    fontWeight = FontWeight.Bold,
                ),
            )

            Box(modifier = GlanceModifier.defaultWeight()) {}

            if (data.nextPrayerName.isNotEmpty()) {
                Text(
                    "${data.labelNextPrayer}: ${data.nextPrayerName} • ${data.countdownLabel()}",
                    style = TextStyle(
                        color = ColorProvider(WidgetTheme.mutedCream),
                        fontSize = 11.sp,
                    ),
                )
            }
        }
    }
}
