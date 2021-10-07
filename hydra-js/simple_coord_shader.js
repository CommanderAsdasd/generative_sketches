//squashes screen

setFunction({
  name: 'squash',type: 'coord',
  inputs: [
    {name: 'cx', type: 'float', default: 1.}
  ],
  glsl: `
	vec2 coord = _st/sin(time*cx);
	return coord;`
})

osc(10,0,2).squash(2.).out()
