//https://hydra-book.glitch.me/#/glsl
//simplest shader with _c0 color passing through. For cords used vec2 _st

setFunction({
  name: 'simple',type: 'color',
  inputs: [
    {name: 'cx', type: 'float', default: 1.}
  ],
  glsl: `
	vec4 color = _c0/sin(time);
	return color;`
})

osc(10,0,2).simple(1.).out()
