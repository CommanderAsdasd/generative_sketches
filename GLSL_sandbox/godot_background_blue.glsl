#ifdef GL_ES
precision mediump float;
#endif

#define sint2 (sin(time) + 1.)
#extension GL_OES_standard_derivatives : enable

uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;

float rabbit(float x, float k, float divider) {
	return k * x * (1.  - k/divider);
}


float plot(vec2 st) {    
    return smoothstep(.02, sint2, abs(st.x - st.y));
}

void main( void ) {

	vec2 uv = ( gl_FragCoord.xy / resolution.xy ) / sin(time) + 1.;
	float pct = plot(vec2(rabbit(uv.x, uv.y * time, time * time)));
	float pct2 = plot(uv - (cos(time) + .1) / 2.);
	float pct3 = plot(vec2(rabbit(time, 1.6, 1.)));

/*	float color = 0.0;
	color += sin( position.x * cos( time / 15.0 ) * 80.0 ) + cos( position.y * cos( time / 15.0 ) * 10.0 );
	color += sin( position.y * sin( time / 10.0 ) * 40.0 ) + cos( position.x * sin( time / 25.0 ) * 40.0 );
	color += sin( position.x * sin( time / 5.0 ) * 10.0 ) + sin( position.y * sin( time / 35.0 ) * 80.0 );
	color *= sin( time / 10.0 ) * 0.5;
*/

	gl_FragColor = vec4(vec3( .3 - pct, .4 - pct2, .5 + pct3), 1.0);

}
