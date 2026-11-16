// Optional Kyuubi Ghostty shader: subtle chakra-ember glyph halo + warm edge vignette.
// Static and deterministic: zero flicker, zero geometric warping, zero cursor trails.
void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = fragCoord / iResolution.xy;
    vec2 px = 1.0 / iResolution.xy;
    vec4 source = texture(iChannel0, uv);

    // Sample cardinal neighbors for a delicate warm chakra bloom on bright strokes
    vec3 neighbors = vec3(0.0);
    neighbors += texture(iChannel0, clamp(uv + vec2(px.x, 0.0), vec2(0.0), vec2(1.0))).rgb;
    neighbors += texture(iChannel0, clamp(uv - vec2(px.x, 0.0), vec2(0.0), vec2(1.0))).rgb;
    neighbors += texture(iChannel0, clamp(uv + vec2(0.0, px.y), vec2(0.0), vec2(1.0))).rgb;
    neighbors += texture(iChannel0, clamp(uv - vec2(0.0, px.y), vec2(0.0), vec2(1.0))).rgb;

    vec3 bloom = max(neighbors * 0.25 - vec3(0.16), vec3(0.0));
    vec3 chakraTint = vec3(1.18, 0.72, 0.42);
    vec3 lit = source.rgb + bloom * chakraTint * 0.085;

    // Gentle radial edge warmth so screen corners feel grounded in seal-ink
    vec2 centered = uv * 2.0 - 1.0;
    float edge = dot(centered, centered);
    float vignette = 1.0 - smoothstep(0.55, 1.85, edge) * 0.14;
    vec3 emberRim = vec3(0.12, 0.025, 0.015) * smoothstep(0.85, 1.75, edge) * source.a;

    fragColor = vec4(min(lit * vignette + emberRim, vec3(1.0)), source.a);
}
