PImage pic;
PImage tmp;
void setup() {
  size (500, 500);
  pic = loadImage("image.jpg");
  pic.loadPixels();
}
void draw() {
  image(pic, 0, 0);
  pic.resize(width, height);
}
void keyPressed() {
  if (key == 'r') {
    pic = loadImage("image.jpg");
  }
  if (key == 'h') {
    pic = horizontalFlip(pic);
  }
  if (key == 'v') {
    pic = verticalFlip(pic);
  }
  if (key == 'm') {
    pic = mirror(pic);
  }
}
PImage horizontalFlip (PImage img) {
  tmp = new PImage(width, height);
  for (int x=0; x<width; x++) {
    for (int y=0; y<height; y++) {
      int i = x+(y*width);
      int o = width-x-1;
      int e = o+(y*width);
      tmp.pixels[i] = color(img.pixels[e]);
    }
  }
  return tmp;
}
PImage verticalFlip (PImage img) {
  tmp = new PImage(width, height);
  for (int x=0; x<width; x++) {
    for (int y=0; y<height; y++) {
      int i = x+(y*width);
      int o = height-y-1;
      int e = x+(o*width);
      tmp.pixels[i] = color(img.pixels[e]);
    }
  }
  return tmp;
}
PImage mirror (PImage img) {
  tmp = new PImage(width, height);
  for (int y=0; y<height; y++) {
    for (int x=0; x<width; x++) {
      int i = x+(y*width);
      int o = width-x-1;
      int e = o+(y*width);
      if (x>width/2) {
        tmp.pixels[i] = color(img.pixels[e]);
      }
      if (x<=width/2) {
        tmp.pixels[i] = img.pixels[i];
      }
    }
  }
  return tmp;
}
