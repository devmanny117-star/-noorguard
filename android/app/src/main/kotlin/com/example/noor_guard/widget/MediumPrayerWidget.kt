package com.example.noor_guard.widget

import android.content.Context
import androidx.compose.runtime.Composable
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.glance.GlanceId
import androidx.glance.GlanceModifier
import androidx.glance.Image
import androidx.glance.ImageProvider
import androidx.glance.action.clickable
import androidx.glance.appwidget.GlanceAppWidget
import androidx.glance.appwidget.action.actionRunCallback
import androidx.glance.appwidget.cornerRadius
import androidx.glance.appwidget.provideContent
import androidx.glance.background
import androidx.glance.currentState
import androidx.glance.layout.Alignment
import androidx.glance.layout.Box
import androidx.glance.layout.Column
import androidx.glance.layout.Row
import androidx.glance.layout.Spacer
import androidx.glance.layout.fillMaxSize
import androidx.glance.layout.fillMaxWidth
import androidx.glance.layout.height
import androidx.glance.layout.padding
import androidx.glance.layout.size
import androidx.glance.text.FontFamily
import androidx.glance.text.FontWeight
import androidx.glance.text.Text
import androidx.glance.text.TextStyle
import androidx.glance.unit.ColorProvider
import com.example.noor_guard.MainActivity
import com.example.noor_guard.R
import es.antonborri.home_widget.HomeWidgetGlanceState
import es.antonborri.home_widget.HomeWidgetGlanceStateDefinition
import es.antonborri.home_widget.HomeWidgetGlanceWidgetReceiver
import es.antonborri.home_widget.actionStartActivity

/** 4x2 premium card: next prayer + time, Hijri date + location, 5 prayer
 * pills, streak, I Prayed button. */
class MediumPrayerWidget : GlanceAppWidget() {
    override val stateDefinition = HomeWidgetGlanceStateDefinition()

    override suspend fun provideGlance(context: Context, id: GlanceId) {
        provideContent { Content(context, currentState()) }
    }

    @Composable
    private fun Content(context: Context, state: HomeWidgetGlanceState) {
        val data = WidgetData.from(state.preferences)

        Box(
            modifier = GlanceModifier
                .fillMaxSize()
                .background(ImageProvider(R.drawable.bg_widget_card))
                .cornerRadius(20.dp)
                .padding(16.dp)
                .clickable(onClick = actionStartActivity<MainActivity>(context)),
        ) {
            Column(modifier = GlanceModifier.fillMaxSize()) {
                // Row 1: next prayer name + time (bigger), crescent+star top-right.
                Row(
                    modifier = GlanceModifier.fillMaxWidth(),
                    verticalAlignment = Alignment.Vertical.CenterVertically,
                ) {
                    Text(
                        data.nextPrayerName,
                        style = TextStyle(
                            color = ColorProvider(WidgetTheme.gold),
                            fontSize = 22.sp,
                            fontWeight = FontWeight.Bold,
                            fontFamily = FontFamily.Serif,
                        ),
                    )
                    Text(
                        "  ${data.nextPrayerTime}",
                        style = TextStyle(
                            color = ColorProvider(WidgetTheme.cream),
                            fontSize = 16.sp,
                            fontWeight = FontWeight.Medium,
                        ),
                    )
                    Box(modifier = GlanceModifier.defaultWeight()) {}
                    Image(
                        provider = ImageProvider(R.drawable.ic_crescent_star_widget),
                        contentDescription = null,
                        modifier = GlanceModifier.size(48.dp),
                    )
                }

                Text(
                    "${data.hijriDate} • ${data.locationLabel}",
                    style = TextStyle(
                        color = ColorProvider(WidgetTheme.mutedCream),
                        fontSize = 11.sp,
                    ),
                )

                Box(modifier = GlanceModifier.defaultWeight()) {}

                // Subtle gold divider.
                Box(
                    modifier = GlanceModifier
                        .fillMaxWidth()
                        .height(1.dp)
                        .background(WidgetTheme.gold.copy(alpha = 0.25f)),
                ) {}

                Box(modifier = GlanceModifier.defaultWeight()) {}

                // 5 prayer pills, pinned directly above the I Prayed button.
                PrayerPillsRow(data.prayers)

                Spacer(modifier = GlanceModifier.height(8.dp))

                // Bottom row: streak (left) + I Prayed button (right, prominent).
                Row(
                    modifier = GlanceModifier.fillMaxWidth(),
                    verticalAlignment = Alignment.Vertical.CenterVertically,
                ) {
                    Text(
                        "🔥 ${data.streakCount} ${data.labelDayStreak}",
                        style = TextStyle(
                            color = ColorProvider(WidgetTheme.gold),
                            fontSize = 13.sp,
                            fontWeight = FontWeight.Medium,
                        ),
                    )
                    Box(modifier = GlanceModifier.defaultWeight()) {}
                    Box(
                        modifier = GlanceModifier
                            .background(WidgetTheme.gold)
                            .cornerRadius(18.dp)
                            .padding(horizontal = 20.dp, vertical = 9.dp)
                            .clickable(onClick = actionRunCallback<PrayedActionCallback>()),
                    ) {
                        Text(
                            data.labelIPrayed,
                            style = TextStyle(
                                color = ColorProvider(WidgetTheme.navy),
                                fontSize = 14.sp,
                                fontWeight = FontWeight.Bold,
                            ),
                        )
                    }
                }
            }
        }
    }
}

class MediumPrayerWidgetReceiver : HomeWidgetGlanceWidgetReceiver<MediumPrayerWidget>() {
    override val glanceAppWidget = MediumPrayerWidget()
}
