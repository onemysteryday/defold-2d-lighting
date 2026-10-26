varying mediump vec2 var_texcoord0;

uniform lowp sampler2D texture_sampler;
uniform lowp vec4 tint;

void main()
{
    // Pre-multiply alpha since all runtime textures already are
    lowp vec4 tint_pm = vec4(tint.xyz * tint.w, tint.w);
    // gl_FragColor = texture2D(texture_sampler, var_texcoord0) * tint_pm;
    vec4 color = texture2D(texture_sampler, var_texcoord0);
    gl_FragColor = vec4(color.rgb * tint.rgb * 1.25, color.a * tint.a);
}
