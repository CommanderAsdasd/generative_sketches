//kinda julia fractal 

setFunction({
  name: 'julia',type: 'coord',
  inputs: [
    {name: 'cx', type: 'float', default: 1.},
        {name: 'cy', type: 'float', default: 1.}
  ],
  glsl: `
    vec2 c = vec2(cx,cy);
    vec2 pos = _st;
    float R_esc = 10.9;
    int i_max = 100;
 for(int i = 0; i < 100; i++) {
float xtemp = (pos.x * pos.x - pos.y * pos.y);
pos.y = 2. * pos.x * pos.y + c.y;
pos.x = xtemp + c.x;
if(abs(pos.x * pos.x + pos.y * pos.y) > R_esc * R_esc) {
			break;
		}
 float val = float(i);
  
 
  }

	vec2 coord = pos;
  

	return coord;`
})
osc(10,1,time).julia(Math.sin(time/10),1.).out()
