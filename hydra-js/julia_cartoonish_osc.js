//mandelbrot_fractal rotating with animated Z

setFunction({
  name: 'julia',type: 'coord',
  inputs: [
    {name: 'cx', type: 'float', default: 1.},
        {name: 'cy', type: 'float', default: 1.}
  ],
  glsl: `
    vec2 pos;
    pos.x = cx;
    pos.y = cy;
    cx = _st.x;
    cy = _st.y;
    vec2 c = (vec2(cx,cy) * 2.) - 1.;
//     c.x = (c.y/c.x)*c.y;
    float R_esc = sin(time*.11)*5.;
 for(int i = 0; i < 9; i++) {
float xtemp = (pos.x * pos.x - pos.y * pos.y);
pos.y = 2. * pos.x * pos.y + c.y;
pos.x = xtemp + c.x;
if(abs(pos.x * pos.x + pos.y * pos.y) > R_esc * R_esc) {
			break;
		}
  }
	return pos;`
})
s0.initCam(1)
.out(s1)
// src(s1)
osc(Math.sin(time)*10, time,time * .1).julia(() => ((Math.cos(time * 0.01) * 1. * Math.sin(time * 0.01))),() => ((-.3 * Math.cos(time * .009))) - 1.5).rotate(Math.sin(time * .1)*.4,Math.cos(time)*.3).out()
