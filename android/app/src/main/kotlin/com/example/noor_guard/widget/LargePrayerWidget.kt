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
import androidx.glance.layout.fillMaxSize
import androidx.glance.layout.fillMaxWidth
import androidx.glance.layout.padding
import androidx.glance.layout.size
import androidx.glance.text.FontStyle
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

/** 4x4: everything in Medium plus the daily verse and a Qibla bearing readout. */
class LargePrayerWidget : GlanceAppWidget() {
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
                .background(WidgetTheme.navy)
                .cornerRadius(16.dp)
                .padding(16.dp)
                .clickable(onClick = actionStartActivity<MainActivity>(context)),
        ) {
            Column(modifier = GlanceModifier.fillMaxSize()) {
                Row(
                    modifier = GlanceModifier.fillMaxWidth(),
                    verticalAlignment = Alignment.Vertical.CenterVertically,
                ) {
                    Text(
                        data.nextPrayerName,
                        style = TextStyle(
                            color = ColorProvider(WidgetTheme.cream),
                            fontSize = 20.sp,
                            fontWeight = FontWeight.Bold,
                        ),
                    )
                    Text(
                        "  ${data.nextPrayerTime}",
                        style = TextStyle(
                            color = ColorProvider(WidgetTheme.gold),
                            fontSize = 15.sp,
                            fontWeight = FontWeight.Medium,
                        ),
                    )
                    Box(modifier = GlanceModifier.defaultWeight()) {}
                    Image(
                        provider = ImageProvider(R.drawable.ic_crescent_star_widget),
                        contentDescription = null,
                        modifier = GlanceModifier.size(24.dp),
                    )
                }

                Text(
                    "${data.hijriDate} • ${data.locationLabel}",
                    style = TextStyle(
                        color = ColorProvider(WidgetTheme.mutedCream),
                        fontSize = 12.sp,
                    ),
                )

                Box(modifier = GlanceModifier.defaultWeight()) {}

                Row(modifier = GlanceModifier.fillMaxWidth()) {
                    for (prayer in data.prayers) {
                        Box(modifier = GlanceModifier.defaultWeight()) {
                            PrayerCompletionDot(prayer)
                        }
                    }
                }

                Box(modifier = GlanceModifier.defaultWeight()) {}

                // Daily verse + Qibla bearing, side by side.
                Row(modifier = GlanceModifier.fillMaxWidth()) {
                    Column(modifier = GlanceModifier.defaultWeight()) {
                        Text(
                            "“${data.dailyVerseText}”",
                            maxLines = 3,
                            style = TextStyle(
                                color = ColorProvider(WidgetTheme.cream),
                                fontSize = 12.sp,
                                fontStyle = FontStyle.Italic,
                            ),
                        )
                        Text(
                            data.dailyVerseRef,
                            style = TextStyle(
                                color = ColorProvider(WidgetTheme.gold),
                                fontSize = 11.sp,
                                fontWeight = FontWeight.Medium,
                            ),
                        )
                    }
                    Spacer(width = 12.dp)
                    QiblaReadout(data)
                }

                Box(modifier = GlanceModifier.defaultWeight()) {}

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
                            .cornerRadius(14.dp)
                            .padding(horizontal = 16.dp, vertical = 7.dp)
                            .clickable(onClick = actionRunCallback<PrayedActionCallback>()),
                    ) {
                        Text(
                            data.labelIPrayed,
                            style = TextStyle(
                                color = ColorProvider(WidgetTheme.navy),
                                fontSize = 13.sp,
                                fontWeight = FontWeight.Bold,
                            ),
                        )
                    }
                }
            }
        }
    }
}

@Composable
private fun Spacer(width: androidx.compose.ui.unit.Dp) {
    Box(modifier = GlanceModifier.size(width = width, height = 1.dp)) {}
}

@Composable
private fun PrayerCompletionDot(prayer: WidgetPrayer) {
    val highlight = prayer.isNext
    Column(horizontalAlignment = Alignment.Horizontal.CenterHorizontally) {
        Text(
            prayer.displayName,
            style = TextStyle(
                color = ColorProvider(if (highlight) WidgetTheme.gold else WidgetTheme.mutedCream),
                fontSize = 12.sp,
                fontWeight = if (highlight) FontWeight.Bold else FontWeight.Normal,
            ),
        )
        Text(
            if (prayer.done) "●" else "○",
            style = TextStyle(
                color = ColorProvider(if (prayer.done) WidgetTheme.green else WidgetTheme.mutedCream),
                fontSize = 11.sp,
            ),
        )
    }
}

@Composable
private fun QiblaReadout(data: WidgetData) {
    val bearing = data.qiblaBearingDegrees
    Column(horizontalAlignment = Alignment.Horizontal.CenterHorizontally) {
        Text(
            "🧭",
            style = TextStyle(fontSize = 16.sp),
        )
        Text(
            data.labelQibla,
            style = TextStyle(
                color = ColorProvider(WidgetTheme.mutedCream),
                fontSize = 10.sp,
            ),
        )
        if (bearing != null) {
            Text(
                "${bearing.toInt()}° ${cardinalDirection(bearing)}",
                style = TextStyle(
                    color = ColorProvider(WidgetTheme.gold),
                    fontSize = 12.sp,
                    fontWeight = FontWeight.Bold,
                ),
            )
        }
    }
}

private fun cardinalDirection(bearing: Double): String {
    val directions = listOf("N", "NE", "E", "SE", "S", "SW", "W", "NW")
    val index = ((bearing % 360) / 45.0).let { if (it < 0) it + 8 else it }.toInt() % 8
    return directions[index]
}

class LargePrayerWidgetReceiver : HomeWidgetGlanceWidgetReceiver<LargePrayerWidget>() {
    override val glanceAppWidget = LargePrayerWidget()
}
