PImage art;
void setup() {
  size (500, 500);
  art = loadImage("image.jpg");
  art.loadPixels();
}
void draw() {
  art.updatePixels();
  image(art, 0, 0);
  art.resize(width,height);
}
void keyPressed() {
  if (key == 'r') {
    art = loadImage("image.jpg");
    art.loadPixels();
  }
  if (key == 'q') {
    colorQuad(art);
    art.updatePixels();
  }
}
void colorQuad(PImage img) {
  for (int x=0; x <width; x++) {
    for (int y=0; y <height; y++) {
      int i = x + (y*width);
      if (i<art.pixels.length) {
        color f = img.pixels[i];
        if (x<width/2 && y<height/2) {
          img.pixels[i] = color (red(f), green(f), 0);
        }
        if (x>width/2 && y<height/2) {
          img.pixels[i] = color (red(f), 0, blue(f));
        }
        if (x<width/2 && y>height/2) {
          img.pixels[i] = color(0, green(f), blue(f));
        }
      }
    }
  }
}
