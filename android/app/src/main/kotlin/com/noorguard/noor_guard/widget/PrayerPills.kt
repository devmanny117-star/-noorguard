package com.noorguard.noor_guard.widget

import androidx.compose.runtime.Composable
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.glance.GlanceModifier
import androidx.glance.ImageProvider
import androidx.glance.appwidget.cornerRadius
import androidx.glance.background
import androidx.glance.layout.Alignment
import androidx.glance.layout.Box
import androidx.glance.layout.Column
import androidx.glance.layout.Row
import androidx.glance.layout.Spacer
import androidx.glance.layout.fillMaxHeight
import androidx.glance.layout.fillMaxWidth
import androidx.glance.layout.height
import androidx.glance.layout.padding
import androidx.glance.layout.width
import androidx.glance.text.FontWeight
import androidx.glance.text.Text
import androidx.glance.text.TextStyle
import androidx.glance.unit.ColorProvider
import com.noorguard.noor_guard.R

private val pillDotGrey = Color(0xFF6B7785)

/** Row of 5 prayer pills (name on top, time below, status dot at the bottom)
 * shared by every home-screen widget size so they all render identically. */
@Composable
fun PrayerPillsRow(prayers: List<WidgetPrayer>) {
    Row(modifier = GlanceModifier.fillMaxWidth()) {
        for ((index, prayer) in prayers.withIndex()) {
            if (index > 0) Spacer(modifier = GlanceModifier.width(6.dp))
            PrayerPill(
                prayer = prayer,
                modifier = GlanceModifier.defaultWeight().height(68.dp),
            )
        }
    }
}

@Composable
private fun PrayerPill(prayer: WidgetPrayer, modifier: GlanceModifier) {
    val nameColor = when {
        prayer.isNext -> WidgetTheme.gold
        prayer.done -> WidgetTheme.mutedCream
        else -> WidgetTheme.mutedCream.copy(alpha = 0.35f)
    }
    val timeColor = when {
        prayer.isNext -> WidgetTheme.gold.copy(alpha = 0.85f)
        prayer.done -> WidgetTheme.mutedCream.copy(alpha = 0.7f)
        else -> WidgetTheme.mutedCream.copy(alpha = 0.3f)
    }
    val dotColor = when {
        prayer.isNext -> WidgetTheme.gold
        prayer.done -> WidgetTheme.green
        else -> pillDotGrey
    }

    val pillContent: @Composable () -> Unit = {
        Column(horizontalAlignment = Alignment.Horizontal.CenterHorizontally) {
            Text(
                prayer.displayName,
                maxLines = 1,
                style = TextStyle(
                    color = ColorProvider(nameColor),
                    fontSize = 10.sp,
                    fontWeight = if (prayer.isNext) FontWeight.Bold else FontWeight.Normal,
                ),
            )
            Spacer(modifier = GlanceModifier.height(1.dp))
            Text(
                prayer.time,
                style = TextStyle(
                    color = ColorProvider(timeColor),
                    fontSize = 13.sp,
                    fontWeight = FontWeight.Bold,
                ),
            )
            Spacer(modifier = GlanceModifier.height(3.dp))
            Text(
                "●",
                style = TextStyle(color = ColorProvider(dotColor), fontSize = 7.sp),
            )
        }
    }

    when {
        prayer.isNext -> {
            // Soft outer halo behind a solid-bordered inner pill, approximating a glow.
            Box(
                modifier = modifier
                    .background(WidgetTheme.gold.copy(alpha = 0.12f))
                    .cornerRadius(10.dp)
                    .padding(2.dp),
                contentAlignment = Alignment.Center,
            ) {
                Box(
                    modifier = GlanceModifier
                        .fillMaxWidth()
                        .fillMaxHeight()
                        .background(ImageProvider(R.drawable.bg_widget_pill_current))
                        .cornerRadius(10.dp)
                        .padding(horizontal = 4.dp),
                    contentAlignment = Alignment.Center,
                ) {
                    pillContent()
                }
            }
        }
        prayer.done -> {
            // Subtle cream fill (same as every pill) + a green border tint.
            Box(
                modifier = modifier
                    .background(ImageProvider(R.drawable.bg_widget_pill_done))
                    .cornerRadius(10.dp)
                    .padding(horizontal = 4.dp),
                contentAlignment = Alignment.Center,
            ) {
                pillContent()
            }
        }
        else -> {
            // Same subtle cream fill, very faint border — not yet due.
            Box(
                modifier = modifier
                    .background(ImageProvider(R.drawable.bg_widget_pill_upcoming))
                    .cornerRadius(10.dp)
                    .padding(horizontal = 4.dp),
                contentAlignment = Alignment.Center,
            ) {
                pillContent()
            }
        }
    }
}
