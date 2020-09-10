#ifdef GL_ES
precision mediump float;
#endif

#extension GL_OES_standard_derivatives : enable

uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;

void main( void ) {
	vec2 position = gl_FragCoord.xy/resolution.xy;
	float color = sin(time + position.x) * 3. + position.y; // adding various  attribs of position changes
	gl_FragColor = vec4(vec3(sin(color * 10.),cos(time),sin(time/time)),1.);
}
