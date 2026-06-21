package com.example.noor_guard

import android.animation.Animator
import android.animation.ValueAnimator
import android.content.Context
import android.graphics.Canvas
import android.graphics.Paint
import android.util.AttributeSet
import android.view.View
import android.view.animation.LinearInterpolator
import androidx.core.content.ContextCompat
import kotlin.math.cos
import kotlin.math.sin
import kotlin.random.Random

/**
 * Brief, self-contained "I Prayed" celebration burst — a handful of small
 * gold/cream rectangles flying up and out from a point with gravity and
 * rotation, fading out over under a second. No animation library needed;
 * just a single ValueAnimator driving onDraw.
 */
class ConfettiView(context: Context, attrs: AttributeSet? = null) : View(context, attrs) {

    private class Particle(
        var x: Float,
        var y: Float,
        var vx: Float,
        var vy: Float,
        var rotation: Float,
        val rotationSpeed: Float,
        val width: Float,
        val height: Float,
        val color: Int,
    )

    private val paint = Paint(Paint.ANTI_ALIAS_FLAG)
    private var particles: List<Particle> = emptyList()
    private var animator: ValueAnimator? = null

    private val palette by lazy {
        intArrayOf(
            ContextCompat.getColor(context, R.color.gold),
            ContextCompat.getColor(context, R.color.gold_light),
            ContextCompat.getColor(context, R.color.cream),
        )
    }

    /** Bursts [count] particles outward and upward from ([originX], [originY]), in this view's own coordinates. */
    fun burst(originX: Float, originY: Float, count: Int = 36) {
        particles = List(count) {
            val angle = Random.nextDouble(0.0, Math.PI)
            val speed = Random.nextDouble(7.0, 18.0).toFloat()
            Particle(
                x = originX,
                y = originY,
                vx = (cos(angle) * speed).toFloat(),
                vy = -(sin(angle) * speed).toFloat() - 4f,
                rotation = Random.nextFloat() * 360f,
                rotationSpeed = Random.nextFloat() * 14f - 7f,
                width = Random.nextFloat() * 6f + 6f,
                height = Random.nextFloat() * 3f + 3f,
                color = palette[Random.nextInt(palette.size)],
            )
        }
        alpha = 1f

        animator?.cancel()
        animator = ValueAnimator.ofFloat(0f, 1f).apply {
            duration = 850L
            interpolator = LinearInterpolator()
            addUpdateListener {
                val progress = it.animatedValue as Float
                for (p in particles) {
                    p.vy += 0.7f
                    p.x += p.vx
                    p.y += p.vy
                    p.rotation += p.rotationSpeed
                }
                alpha = (1f - progress).coerceIn(0f, 1f)
                invalidate()
            }
            addListener(object : Animator.AnimatorListener {
                override fun onAnimationStart(animation: Animator) {}
                override fun onAnimationCancel(animation: Animator) {}
                override fun onAnimationRepeat(animation: Animator) {}
                override fun onAnimationEnd(animation: Animator) {
                    particles = emptyList()
                    invalidate()
                }
            })
            start()
        }
    }

    override fun onDraw(canvas: Canvas) {
        super.onDraw(canvas)
        for (p in particles) {
            paint.color = p.color
            canvas.save()
            canvas.translate(p.x, p.y)
            canvas.rotate(p.rotation)
            canvas.drawRect(-p.width / 2, -p.height / 2, p.width / 2, p.height / 2, paint)
            canvas.restore()
        }
    }

    /** Stops any in-flight burst — call when the host screen is going away. */
    fun cancel() {
        animator?.cancel()
        animator = null
        particles = emptyList()
    }
}
