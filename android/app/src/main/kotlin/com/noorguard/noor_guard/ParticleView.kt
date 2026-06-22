package com.noorguard.noor_guard

import android.animation.ValueAnimator
import android.content.Context
import android.graphics.Canvas
import android.graphics.Color
import android.graphics.Paint
import android.util.AttributeSet
import android.view.View
import kotlin.random.Random

/**
 * Continuous ambient background decoration: small gold dots drifting slowly
 * upward, fading in near the bottom edge and out near the top, looping
 * forever by respawning each particle at the bottom once it drifts off the
 * top. Purely decorative — never clickable/focusable, so it never steals
 * touches from the buttons/pills drawn on top of it.
 */
class ParticleView(context: Context, attrs: AttributeSet? = null) : View(context, attrs) {

    private class Particle(var x: Float, var y: Float, var speed: Float, var radius: Float, var baseAlpha: Int)

    companion object {
        private const val PARTICLE_COUNT = 26

        /** Fraction of the screen height, at both the bottom and the top, over which a particle fades. */
        private const val FADE_ZONE = 0.2f
    }

    init {
        isClickable = false
        isFocusable = false
    }

    private val paint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
        color = Color.parseColor("#C9A84C")
        style = Paint.Style.FILL
    }

    private var particles: List<Particle> = emptyList()
    private var ticker: ValueAnimator? = null

    override fun onSizeChanged(w: Int, h: Int, oldw: Int, oldh: Int) {
        super.onSizeChanged(w, h, oldw, oldh)
        if (w <= 0 || h <= 0) return
        if (particles.isEmpty()) {
            particles = List(PARTICLE_COUNT) { newParticle(spawnAnywhere = true) }
        }
        if (ticker == null) startTicking()
    }

    /** Builds a freshly randomized particle — either anywhere on screen (initial seeding) or just below the bottom edge (respawn). */
    private fun newParticle(spawnAnywhere: Boolean): Particle {
        val density = resources.displayMetrics.density
        val w = width.takeIf { it > 0 } ?: 1
        val h = height.takeIf { it > 0 } ?: 1
        val diameterDp = Random.nextFloat() * 5f + 3f // 3-8dp
        return Particle(
            x = Random.nextFloat() * w,
            y = if (spawnAnywhere) Random.nextFloat() * h else h + Random.nextFloat() * h * 0.08f,
            speed = (Random.nextFloat() * 0.4f + 0.35f) * density, // slow upward drift, px/tick
            radius = diameterDp * density / 2f,
            baseAlpha = (Random.nextFloat() * 51f + 102f).toInt(), // ~40%-60% of 255
        )
    }

    private fun startTicking() {
        ticker = ValueAnimator.ofFloat(0f, 1f).apply {
            duration = 16L
            repeatCount = ValueAnimator.INFINITE
            addUpdateListener { step() }
            start()
        }
    }

    private fun step() {
        if (height <= 0) return
        for (p in particles) {
            p.y -= p.speed
            if (p.y < -p.radius * 2) {
                val fresh = newParticle(spawnAnywhere = false)
                p.x = fresh.x
                p.y = fresh.y
                p.speed = fresh.speed
                p.radius = fresh.radius
                p.baseAlpha = fresh.baseAlpha
            }
        }
        invalidate()
    }

    override fun onDraw(canvas: Canvas) {
        super.onDraw(canvas)
        val h = height.toFloat()
        if (h <= 0) return
        for (p in particles) {
            val progress = (1f - p.y / h).coerceIn(0f, 1f)
            val fadeFraction = when {
                progress < FADE_ZONE -> progress / FADE_ZONE
                progress > 1f - FADE_ZONE -> (1f - progress) / FADE_ZONE
                else -> 1f
            }
            paint.alpha = (p.baseAlpha * fadeFraction).toInt().coerceIn(0, 255)
            canvas.drawCircle(p.x, p.y, p.radius, paint)
        }
    }

    /** Stops the drift loop — call when the host screen is going away. */
    fun stop() {
        ticker?.cancel()
        ticker = null
    }

    // Decorative only: never consume touches, so taps always reach whatever is drawn underneath/above in z-order.
    override fun onTouchEvent(event: android.view.MotionEvent): Boolean = false
}
