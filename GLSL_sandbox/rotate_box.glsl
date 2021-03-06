#ifdef GL_ES
precision mediump float;
#endif

#extension GL_OES_standard_derivatives : enable

uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;

float box(in vec2 _st, in vec2 _size ) {
	    _size = vec2(0.5) - _size*0.5;
	vec2 uv = smoothstep(_size, 
			     _size+vec2(0.0001), 
			     _st); // Smoothstep family sigmoid-like interpolation and clamping f commonly used in computer graphics
	uv *= smoothstep(_size, 
			 _size+vec2(0.001), 
			 vec2(1.0)-_st);
	return uv.x*uv.y;
}

mat2 rotate2d(float _angle){
	return mat2(cos(_angle), -sin(_angle),
		    sin(_angle), cos(_angle));
}

//float cross(in vec2 _st, in float _size) {
//	return box(_st, vec2()
//}

void main( void ) {
	vec2 st = gl_FragCoord.xy/resolution.xy;
	st = rotate2d(time) * st; //for matrices and vec2 defined only multiplication - it makes rotation
	vec3 color = vec3(0,.9,.5);
	color += vec3(box(st, vec2(.25)));
        gl_FragColor = vec4(color.x, color.yz * rotate2d(time), 1.);
}
