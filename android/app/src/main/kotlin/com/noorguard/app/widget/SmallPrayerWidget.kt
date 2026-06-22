package com.noorguard.app.widget

import android.content.Context
import androidx.compose.runtime.Composable
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
import androidx.glance.layout.Box
import androidx.glance.layout.Column
import androidx.glance.layout.Spacer
import androidx.glance.layout.fillMaxSize
import androidx.glance.layout.fillMaxWidth
import androidx.glance.layout.height
import androidx.glance.layout.padding
import androidx.glance.layout.wrapContentHeight
import androidx.glance.text.FontWeight
import androidx.glance.text.Text
import androidx.glance.text.TextStyle
import androidx.glance.unit.ColorProvider
import com.noorguard.app.MainActivity
import com.noorguard.app.R
import es.antonborri.home_widget.HomeWidgetGlanceState
import es.antonborri.home_widget.HomeWidgetGlanceStateDefinition
import es.antonborri.home_widget.HomeWidgetGlanceWidgetReceiver
import es.antonborri.home_widget.actionStartActivity

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

                    PrayerPillsRow(data.prayers)
                }
            }
        }
    }
}

class SmallPrayerWidgetReceiver : HomeWidgetGlanceWidgetReceiver<SmallPrayerWidget>() {
    override val glanceAppWidget = SmallPrayerWidget()
}
