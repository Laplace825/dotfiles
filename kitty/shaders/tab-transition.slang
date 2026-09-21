#language slang 2026
// Tab transition — a brief fade-in with a subtle upward settle whenever the
// active tab changes. animation_progress (0 → 1) drives the effect over the
// pipeline duration; the pipeline should use an ease-out curve.

import kitty_custom_shader_types;

// Brightness at animation start (1.0 = no dimming).
static const float MIN_BRIGHTNESS = 0.55;
// Vertical settle distance at animation start, in UV units.
static const float SLIDE_DISTANCE = 0.012;

public float4
fragment_main(float4 color, KittyTextures t, KittyCustomShaderData d) {
    float remaining = 1.0 - t.animation_progress;
    if (remaining <= 0.0) return color;

    // Sample slightly below so content appears to settle downward into place.
    float2 uv = t.pos - float2(0.0, remaining * SLIDE_DISTANCE);
    float4 c = t.backbuffer.Sample(uv);
    float brightness = lerp(1.0, MIN_BRIGHTNESS, remaining);
    return float4(c.rgb * brightness, c.a);
}
