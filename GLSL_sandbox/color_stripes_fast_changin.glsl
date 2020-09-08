precision mediump float;

uniform float time;
uniform vec2 resolution;

void main(void){
	float t = exp(time/3.);
	vec2 position = gl_FragCoord.xy/resolution.xy/(abs(fract(t/16.)-.5) + .5);
	float x = abs(position.x - .5) - abs(fract(t/.7));
	float y = abs(position.x - .5) - abs(fract(t/1.5));
	
	float a = y/x;
	float b = x/y/cos(t/x/y)/8.;
	
	gl_FragColor = vec4(a+position.x, b + position.y, t, 1.);
}
