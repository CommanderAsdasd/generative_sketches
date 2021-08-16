#ifdef GL_ES
precision mediump float;
#endif

#extension GL_OES_standard_derivatives : enable

uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;

void main( void ) {
	vec3 color = vec3(.2,.3,.8);
	float pix = -.1;
	vec2 uv = (gl_FragCoord.xy * 2. - resolution) / min(resolution, resolution.x);
	
	for (float i=0.;i<100.;i++) {
		float si = sin(time + i * .05)/i;
		pix += .1/ abs(length(uv - i));
	}
	//pix -= uv.x + pix;
	
	gl_FragColor = vec4(vec3(pix),1.);
}
