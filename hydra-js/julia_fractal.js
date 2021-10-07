//julia_fractal rotating

setFunction({
  name: 'julia',type: 'coord',
  inputs: [
    {name: 'cx', type: 'float', default: 1.},
        {name: 'cy', type: 'float', default: 1.}
  ],
  glsl: `
    vec2 c = vec2(cx,cy);
    c.x = (c.y/c.x)*c.y;
    vec2 pos = _st * 1.;
    float R_esc = sin(time/10.)*5.;
    int i_max = 100;
 for(int i = 0; i < 9; i++) {
float xtemp = (pos.x * pos.x - pos.y * pos.y);
pos.y = 2. * pos.x * pos.y + c.y;
pos.x = xtemp + c.x;
if(abs(pos.x * pos.x + pos.y * pos.y) > R_esc * R_esc) {
			break;
		}
 float val = float(i);
  
 
  }

	vec2 coord = pos;
  

	return pos;`
})
s0.initCam(1)
src(s0).out()
src(s0).julia(.1,.2).rotate(3,1).out()
