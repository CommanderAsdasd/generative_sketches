const float amplitude = 0.1;

vec2 shift(vec2 pos){
    return vec2(0.0, sin((pos.x * 2.0 - 1.0) * 6.283 * (abs(sin(iTime)) * 8.0)) / 32.0);
}



float julia(vec2 pos, vec2 c) {

	//per-pixel cycle

	float R_esc = 10.9;	
	float color;
	int i_max = 100;
	//pos.x = map(pos.x, vec2(0.,1.), vec2(-2.,2.));
	//pos.y = map(pos.y, vec2(0.,1.), vec2(-2.,2.));
	
	for(int i = 0; i < i_max; i++ ) {
	
        float xtemp = (pos.x * pos.x - pos.y * pos.y);
		pos.y = 1. * pos.x * pos.y + c.y;
		pos.x = xtemp + c.x;
		
		//color.z = line(vec2(pos.x));
		if(abs(pos.x * pos.x + pos.y * pos.y) > R_esc * R_esc) {

			break;
		}
		int val = i;
		color = float(val);
	}
	
	return color;
}


void mainImage( out vec4 fragColor, in vec2 fragCoord )
{

	vec2 pos = fragCoord.xy / iResolution.xy;
    //vec2 outcol = vec2(julia(pos, vec2(0.3,1.1)), julia(pos, vec2(1.21,.2)));
    vec2 c; 
    c = texture(iChannel0,pos).yx * vec2(tan(iTime)*4.5,sin(iTime)*4.);
//    c = vec2(0.1,.2);
    fragColor = texture(iChannel0, pos / julia(pos,c));
}
