package com.example.noor_guard.widget

import android.content.Context
import androidx.compose.runtime.Composable
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.glance.GlanceId
import androidx.glance.GlanceModifier
import androidx.glance.ImageProvider
import androidx.glance.action.clickable
import androidx.glance.appwidget.GlanceAppWidget
import androidx.glance.appwidget.cornerRadius
import androidx.glance.appwidget.provideContent
import androidx.glance.background
import androidx.glance.currentState
import androidx.glance.layout.Alignment
import androidx.glance.layout.Box
import androidx.glance.layout.Column
import androidx.glance.layout.Row
import androidx.glance.layout.Spacer
import androidx.glance.layout.fillMaxHeight
import androidx.glance.layout.fillMaxSize
import androidx.glance.layout.fillMaxWidth
import androidx.glance.layout.height
import androidx.glance.layout.padding
import androidx.glance.layout.width
import androidx.glance.layout.wrapContentHeight
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

private val grey = Color(0xFF6B7785)

/** Compact widget: tiny faded brand mark + a row of 5 prayer pills, each
 * showing name, time, and a status dot (green=done, gold=current, grey=upcoming). */
class SmallPrayerWidget : GlanceAppWidget() {
    override val stateDefinition = HomeWidgetGlanceStateDefinition()

    override suspend fun provideGlance(context: Context, id: GlanceId) {
        provideContent { Content(context, currentState()) }
    }

    @Composable
    private fun Content(context: Context, state: HomeWidgetGlanceState) {
        val data = WidgetData.from(state.preferences)

        // Outer container is fully transparent and fills whatever bounds the
        // launcher grants the widget. The navy card underneath is a separate,
        // tightly-wrapped inner layer, so any extra space the host reserves
        // around the widget shows the wallpaper through rather than navy.
        Box(modifier = GlanceModifier.fillMaxSize()) {
            Box(
                modifier = GlanceModifier
                    .fillMaxWidth()
                    .wrapContentHeight()
                    .background(ImageProvider(R.drawable.bg_widget_card))
                    .cornerRadius(16.dp)
                    .padding(horizontal = 14.dp, vertical = 10.dp)
                    .clickable(onClick = actionStartActivity<MainActivity>(context)),
            ) {
                Column(modifier = GlanceModifier.fillMaxWidth().wrapContentHeight()) {
                    Box(modifier = GlanceModifier.height(16.dp)) {
                        Text(
                            // Glance's TextStyle has no letterSpacing — approximated by
                            // spacing the letters themselves.
                            "N O O R   G U A R D",
                            style = TextStyle(
                                color = ColorProvider(WidgetTheme.gold.copy(alpha = 0.5f)),
                                fontSize = 9.sp,
                                fontWeight = FontWeight.Medium,
                            ),
                        )
                    }

                    Spacer(modifier = GlanceModifier.height(6.dp))

                    Row(modifier = GlanceModifier.fillMaxWidth()) {
                        for ((index, prayer) in data.prayers.withIndex()) {
                            if (index > 0) Spacer(modifier = GlanceModifier.width(6.dp))
                            CompactPrayerPill(
                                prayer = prayer,
                                modifier = GlanceModifier.defaultWeight().height(68.dp),
                            )
                        }
                    }
                }
            }
        }
    }
}

@Composable
private fun CompactPrayerPill(prayer: WidgetPrayer, modifier: GlanceModifier) {
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
        else -> grey
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

class SmallPrayerWidgetReceiver : HomeWidgetGlanceWidgetReceiver<SmallPrayerWidget>() {
    override val glanceAppWidget = SmallPrayerWidget()
}
