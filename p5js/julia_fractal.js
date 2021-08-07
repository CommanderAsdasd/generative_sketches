canvasSize = 800

function setup() {
    createCanvas(canvasSize, canvasSize);
    background("ffffff");
    julia_fractal(1,.1);
}

function draw() {
}

function julia_fractal(cx, cy) {
    // f(z) = z^2 + c
    // z is free variable, c is provided as constant parameter 
    //Create an Image
    let finalImage = createImage(canvasSize, canvasSize);
    //Load all Pixels
    finalImage.loadPixels();
    
    R_esc = 15.; // higher radius - more curves
    i_max = 4; //
    for (var y = 0; y < height; y++) {
        for (var x = 0; x < width; x++) {

            zx = map(x,0,canvasSize,-2,2);
            zy = map(y,0,canvasSize,-2,2);
            i = 0;

            while (i < i_max) {
                xtemp = zx * zx - zy * zy //
                zy = (2 * zx * zy) + cy
                zx = xtemp + cx
                i++
                if (abs(zx+zy) > R_esc) {
                    finalImage.set(x, y, color(0,map(i,0, i_max, 0, 255),0));
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
