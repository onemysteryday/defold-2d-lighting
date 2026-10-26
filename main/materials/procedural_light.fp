varying mediump vec4 position;
varying mediump vec2 var_texcoord0;

uniform lowp sampler2D texture_sampler;
uniform lowp vec4 tint;

void main()
{
	// Pre-multiply alpha since all runtime textures already are
	// lowp vec4 tint_pm = vec4(tint.xyz * tint.w, tint.w);
	// gl_FragColor = texture2D(texture_sampler, var_texcoord0.xy) * tint_pm;

	vec2 p = (var_texcoord0 - vec2(0.5)) * 2.0;
	float r = length(p);

	if (r >= 1.0) {
		discard;
	}

	float falloff = 1.0 - smoothstep(0.0, 1.0, r);
	falloff = pow(falloff, 0.75);

	float intensity = 1.1;
	float alpha = clamp(falloff * intensity, 0.0, 1.0);
	alpha *= tint.a;

	gl_FragColor = vec4(tint.rgb, alpha);
}
