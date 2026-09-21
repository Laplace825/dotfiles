#language slang 2026
// Idle dim — darkens the whole screen while the user is idle, with a gentle
// vignette toward the corners. Activated by the user-idle event and removed
// by user-activity, so it uses no animation_progress: the group simply runs
// for as long as the idle state lasts (same pattern as the shipped
// spotlight shader).

import kitty_custom_shader_types;

// How much to darken the screen while idle (0 = no change, 1 = black).
static const float DIM_AMOUNT = 0.30;
// Extra darkening toward the corners (0 = uniform dim).
static const float VIGNETTE = 0.20;

public float4
fragment_main(float4 color, KittyTextures t, KittyCustomShaderData d) {
    float2 centered = t.pos - float2(0.5);
    // length(centered) at corners is ~0.707; normalize to ~1.0.
    float vignette = 1.0 - VIGNETTE * smoothstep(0.45, 0.95, length(centered) * 1.41421356);
    return float4(color.rgb * (1.0 - DIM_AMOUNT) * vignette, color.a);
}
