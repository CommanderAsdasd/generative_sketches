const float amplitude = 0.1;

vec2 shift(vec2 pos){
    return vec2(0.0, sin((pos.x * 2.0 - 1.0) * 6.283 * (abs(sin(iTime)) * 8.0)) / 32.0);
}



float julia(vec2 pos, vec2 c) {

	//per-pixel cycle

	float R_esc = 3.9;	
	float color;
	int i_max = 40;
	
	for(int i = 0; i < i_max; i++ ) {
	
    float xtemp = (pos.x * pos.x - pos.y * pos.y);
		pos.y = 1. * pos.x * pos.y + c.y;
		pos.x = xtemp + c.x;
		
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
  fragColor = texture(iChannel0, pos * julia(pos,texture(iChannel0,pos).xy));
}
