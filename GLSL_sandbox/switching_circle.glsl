#ifdef GL_ES
precision mediump float;
#endif

#extension GL_OES_standard_derivatives : enable

uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;

float circle(vec2 uv, vec2 pos, float radius) {
	return length(uv - pos) - radius;
}

vec2 rotate(vec2 uv, float angle) {
	mat2 rot;
	rot[0] = vec2(cos(angle), -sin(angle));
	rot[1] = vec2(cos(angle), sin(angle));
	return rot * uv;
}

void main( void ) {

	vec2 uv = ( gl_FragCoord.xy / resolution.xy );
	uv = rotate(uv, sin(time));
	float color = 0.0;
	vec2 rotated = rotate(vec2(circle(gl_FragCoord.xy, resolution/2., 30.), sin(time) * 100.), 20.);
	gl_FragColor = vec4(rotated, 1., 1.);

}
