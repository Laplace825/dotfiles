#language slang 2026
// Bell pulse — highlights the window that most recently received a BEL.
// The window border lights up with a soft breathing glow that fades out
// over the pipeline duration. Uses d.bell_window_geometry (UV, origin
// bottom-left, .xy = lower-left corner, .zw = size). When the belled
// window is not visible, kitty reports the central area instead, so the
// pulse is still noticeable.

import kitty_custom_shader_types;

// Pulse color in linear RGB (Catppuccin Mocha mauve #cba6f7).
static const float3 PULSE_COLOR = float3(0.597, 0.381, 0.930);
// Width of the bright band centered on the window border, in pixels.
static const float BORDER_WIDTH_PX = 5.0;
// Falloff distance of the soft halo outside the window, in pixels.
static const float HALO_WIDTH_PX = 26.0;
// Peak brightness of the border band (additive).
static const float BORDER_STRENGTH = 0.8;
// Subtle tint mixed into the window content at animation start.
static const float FILL_STRENGTH = 0.10;
// Number of breathing cycles over the animation duration.
static const float PULSES = 2.0;

// SDF of an axis-aligned box. p = query point, center = box centre, hext = half-extents.
static float
sdBox(float2 p, float2 center, float2 hext) {
    float2 d = abs(p - center) - hext;
    return length(max(d, float2(0.0))) + min(max(d.x, d.y), 0.0);
}

public float4
fragment_main(float4 color, KittyTextures t, KittyCustomShaderData d) {
    float4 g = d.bell_window_geometry;
    if (g.z <= 0.0 || g.w <= 0.0) return color;

    float fade = 1.0 - t.animation_progress;
    if (fade <= 0.0) return color;
    // Breathing envelope: oscillates while the overall fade decays.
    float strength = fade * (0.6 + 0.4 * sin(t.animation_progress * 6.28318530718 * PULSES));

    // Work in pixel space for correct aspect-ratio distances.
    float2 pixelDims = float2(d.viewport_size_pixels) * t.viewport.zw;
    float2 px = t.pos * pixelDims;
    float2 center = (g.xy + g.zw * 0.5) * pixelDims;
    float2 hext = g.zw * 0.5 * pixelDims;

    float sd = sdBox(px, center, hext);

    float band = 1.0 - smoothstep(0.0, BORDER_WIDTH_PX, abs(sd));
    float halo = exp(-max(sd, 0.0) / HALO_WIDTH_PX) * 0.5;
    float inside = 1.0 - smoothstep(-2.0, 2.0, sd);

    float3 c = lerp(color.rgb, PULSE_COLOR, inside * FILL_STRENGTH * strength);
    c += PULSE_COLOR * (band * BORDER_STRENGTH + halo) * strength;
    return float4(c, color.a);
}
