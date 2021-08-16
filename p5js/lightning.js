canvasSize = 1080;

function setup() {
  createCanvas(canvasSize, canvasSize);
  background("ffffff");
  julia_fractal(-0.9, random(-1,1));
}

function draw() {}

function julia_fractal(cx, cy) {
  // f(z) = z^2 + c
  // z is free variable, c is provided as constant parameter
  //Create an Image
  let finalImage = createImage(canvasSize, canvasSize);
  //Load all Pixels
  finalImage.loadPixels();

  R_esc = 50; // higher radius - more curves
  i_max = 14; //
  for (var y = 0; y < height; y++) {
    for (var x = 0; x < width; x++) {
      zx = map(x, -250, canvasSize + 250 * sin(1/width), -2, 2);
      zy = map(y, 0, canvasSize, -2, 2);
      i = 0;
        cx = cx * cx
        cy = pow(cx, cx)
      while (i < i_max) {
        xtemp = zx * zx - zy * zy; //
        zy = 2 * zx * zy + cy;

        zx = xtemp + cx;
        i++;
        if (abs(zx + zy) > R_esc) {
          finalImage.set(x, y, color(i_max + 25, map(i, 0, i_max, 0, random(0,255)), 100-i_max));
          break; // break is mandatory
        }
      }
      //Update the image with the calculated pixels
    }
  }
  finalImage.updatePixels();
  //Display the image
  image(finalImage, 0, 0);
}
