#extension GL_OES_standard_derivatives : enable

precision highp int;
precision highp float;

uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;
const int i_max = 6 ;

float map(float val, vec2 from, vec2 to) {
	return to.x + (val - from.x) * (to.y - from.y) / (to.x - from.x);	
}

float line(vec2 st) {
	return smoothstep(0.02,0.,abs(st.x-st.y));
}

vec3 julia(vec2 pos, vec2 c) {

	//per-pixel cycle

	float R_esc = .79;	
	vec3 color;
	
	//pos.x = map(pos.x, vec2(0.,1.), vec2(-2.,2.));
	//pos.y = map(pos.y, vec2(0.,1.), vec2(-2.,2.));
	
	for(int i = 0; i < i_max; i++ ) {
	
		pos.x = (pos.x * pos.x - pos.y * pos.y) + c.x;
		pos.y = (pos.x * pos.y + pos.x * pos.y) + c.y;
		
		//color.z = line(vec2(pos.x));
		if(abs(pos.x * pos.x + pos.y * pos.y) > R_esc) {
			

			break;
		}
		int val = i;
		color = vec3(val);
	}
	
	return color;
}



void main( void ) {
	vec2 st = ((gl_FragCoord.xy / resolution ) - .5) * 3.;
	//vec4 color = vec4(st.y);
	//gl_FragColor = color;
		//vec4(1.-line(st));
	//float pct = ;
	  //              color = 
	gl_FragColor = vec4(
		julia(st, vec2(sin(time), cos(time))),
		1.);
}
