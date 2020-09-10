#ifdef GL_ES
precision mediump float;
#endif

#extension GL_OES_standard_derivatives : enable

uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;

void main( void ) {
	vec2 position = gl_FragCoord.xy/resolution.xy + 20.;
	float color = sin(time * position.x) * 3.;
	gl_FragColor = vec4(vec3(sin(color),cos(time),sin(time)),1.);
}
