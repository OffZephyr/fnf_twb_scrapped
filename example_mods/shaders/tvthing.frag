// Shader Viewed Here: https://www.shadertoy.com/view/mlS3WG

#pragma header
vec2 uv = openfl_TextureCoordv.xy;
vec2 fragCoord = openfl_TextureCoordv*openfl_TextureSize;
vec2 iResolution = openfl_TextureSize;
uniform float iTime;
#define iChannel0 bitmap
#define texture flixel_texture2D
#define fragColor gl_FragColor
#define mainImage main

void mainImage()
{
    vec2 q = fragCoord.xy / iResolution.xy;
    vec2 uv = 0.5 + (q-0.5)*(1.0 + 0.5*sin(0.0*iTime));

    vec3 oricol = texture( iChannel0, vec2(q.x,1.0-q.y) ).xyz;
    vec3 col;

    col.r = texture(iChannel0,vec2(uv.x+0.001,uv.y)).x;
    col.g = texture(iChannel0,vec2(uv.x+0.000,uv.y)).y;
    col.b = texture(iChannel0,vec2(uv.x-0.001,uv.y)).z;

    col = clamp(col*0.5+0.5*col*col*1.2,0.0,1.0);

    col *= 0.5 + 0.5*16.0*uv.x*uv.y*(1.0-uv.x)*(1.0-uv.y);

    col *= vec3(0.95,1.05,0.95);

    col *= 0.9+0.1*sin(24.0*iTime-uv.y*1000.0);

    fragColor = vec4(col,1.0);
}