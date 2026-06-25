package com.noorguard.app

import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.Typeface
import androidx.core.content.res.ResourcesCompat
import org.json.JSONObject
import java.io.BufferedReader
import java.util.concurrent.ConcurrentHashMap
import java.util.concurrent.atomic.AtomicBoolean

/**
 * Warms every [BlockActivity] dependency — the verse pool, hero photos, and
 * fonts — on a background thread the moment
 * [AppBlockerAccessibilityService] connects, which happens at boot / whenever
 * the service is (re)enabled, long before any blocked app actually opens.
 * BlockActivity then reads straight from these in-memory caches instead of
 * doing file I/O, JSON parsing, or bitmap decoding on its own onCreate.
 */
object BlockScreenCache {

    data class Verse(val reference: String, val arabic: String, val translations: Map<String, String>)

    private val warmed = AtomicBoolean(false)
    private val heroBitmaps = ConcurrentHashMap<Int, Bitmap>()

    private val heroDrawableIds = intArrayOf(
        R.drawable.img_hero_fajr,
        R.drawable.img_hero_dhuhr,
        R.drawable.img_hero_asr,
        R.drawable.img_hero_maghrib,
        R.drawable.img_hero_isha,
    )

    @Volatile var verses: List<Verse> = emptyList()
        private set

    @Volatile var arabicTypeface: Typeface? = null
        private set

    /** Safe to call repeatedly (BlockActivity calls it too, defensively) —
     *  only the first call does any work. */
    fun warm(context: Context) {
        if (!warmed.compareAndSet(false, true)) return
        val appContext = context.applicationContext
        Thread({
            AppBlockingStore(appContext).enabled
            loadVerses(appContext)
            loadFonts(appContext)
            decodeHeroBitmaps(appContext)
        }, "BlockScreenCache-warm").start()
    }

    fun randomVerse(): Verse? = verses.randomOrNull()

    fun heroBitmap(drawableId: Int): Bitmap? = heroBitmaps[drawableId]

    private fun loadVerses(context: Context) {
        verses = try {
            val stream = context.assets.open("flutter_assets/assets/data/block_screen_verses.json")
            val json = stream.bufferedReader().use(BufferedReader::readText)
            val versesArray = JSONObject(json).getJSONArray("verses")
            (0 until versesArray.length()).map { i ->
                val pick = versesArray.getJSONObject(i)
                val translationsObj = pick.getJSONObject("translations")
                val translations = mutableMapOf<String, String>()
                for (key in translationsObj.keys()) translations[key] = translationsObj.getString(key)
                Verse(pick.getString("reference"), pick.getString("arabic"), translations)
            }
        } catch (_: Exception) {
            emptyList()
        }
    }

    private fun loadFonts(context: Context) {
        arabicTypeface = try {
            ResourcesCompat.getFont(context, R.font.scheherazade_new)
        } catch (_: Exception) {
            null
        }
        // Playfair Display is referenced directly via android:fontFamily in
        // activity_block_screen.xml, with no Kotlin-side use — touching it
        // here just primes the same system font cache inflate will hit.
        try {
            ResourcesCompat.getFont(context, R.font.playfair_display)
        } catch (_: Exception) {
        }
    }

    /** RGB_565 halves the memory of the default ARGB_8888 decode — these are
     *  opaque photos with no alpha channel, and all 5 stay resident for as
     *  long as the accessibility service's process is alive. */
    private fun decodeHeroBitmaps(context: Context) {
        val options = BitmapFactory.Options().apply { inPreferredConfig = Bitmap.Config.RGB_565 }
        for (id in heroDrawableIds) {
            try {
                BitmapFactory.decodeResource(context.resources, id, options)?.let { heroBitmaps[id] = it }
            } catch (_: Exception) {
            }
        }
    }
}
