#ifdef GL_ES
precision mediump float;
#endif

uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;
varying vec2 surfacePosition;


void main( void ) {
	vec2 v = (gl_FragCoord.xy - resolution/2.0) / min(resolution.y,resolution.x);
	v = surfacePosition;
	vec2 center = vec2(0.26+mouse.x/100.,0.59+mouse.y/100.+time/1000.);
	float zoom = 0.007741/1.33333+time/100.;
	v*=zoom;v+=center;
	vec2 m = mouse;
	m = vec2(0.35,0.5);
	vec2 z = v;
	float iter = 1.;
	float sum = 0.;
	float M = 65536.;
	#define N 60
	for(int i=1;i<N;++i){
		iter = float(i);
		float angle = atan(z.y, z.x)+time;
		sum+=sin(angle*10.)*.5 +.5;
		if(length(z)>M) break;
		z = vec2(z.x * z.x - z.y * z.y, z.x*z.y + z.y*z.x) + v;
	}
	sum/=iter;
	float color = sum;
	color = (color - m.x)*(m.y*10.+1.);
	gl_FragColor = vec4(color,color-sin(time/1000.),color,color-.1);
}


