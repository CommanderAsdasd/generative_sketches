#ifdef GL_ES
precision mediump float;
#endif

#extension GL_OES_standard_derivatives : enable

uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;

mat2 rotate2d(float angle) {
	return mat2(sin(angle),cos(angle),
		   sin(angle),-cos(angle));
}



void main( void ) {
	vec2 position = gl_FragCoord.xy/resolution.xy + 100.;
	float color = sin(time + position.y - position.x) * 3. + position.y / position.x; // adding various  attribs of position changes
	vec2 l = vec2(cos(time + position.y - position.x) * 3. / sin(position.y * position.x)) * rotate2d(time); //
	gl_FragColor = vec4(vec3(sin(l.x * 10.),cos(l.x),sin(time/time)),1.);
	gl_FragColor = vec4(l,l);
}
