#ifdef GL_ES
precision mediump float;
#endif

#extension GL_OES_standard_derivatives : enable

uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;

//float line(float size, vec3 color) {
	
//}

void main( void ) {

	vec2 uv = ( gl_FragCoord.xy / resolution.xy ); 
	vec4 color;
	//color = time;
	float x = cos(time) + .1;
	float w = sin(time) + 1.;
	for (float i = 0.; i< 1.; i+=.2) {
	if (uv.x < i +.2 && uv.x > i) {
           w = cos(time) + i;
	   color = vec4(x*w + pow(x,i)*w, x*w + pow(x,1.)*w, x*w + x*x*w, 1.);	
	}
	}
	color = vec4(x*w + pow(x,10.)*w, x*w + pow(x,2.)*w, x*w + x*x*w, 1.);
	gl_FragColor = color;
}
