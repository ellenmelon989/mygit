PImage pic;
PImage tmp;
int count = 0;
int repcountx = 1;
int repcounty = 1;
int gcount = 0;
float[][] kernel = {{ -1, -1, -1},
  { -1, 10, -1},
  { -1, -1, -1}};
void setup() {
  size (500, 500);
  pic = loadImage("art.jpg");
  pic.loadPixels();
  //tmp = new PImage(width, height);
  //copy(pic,0,0,width,height,0,0,width,height);
  //tmp.loadPixels();
}
void draw() {
  if (gcount%2==0) {
    tmp = gray(pic);
    image(pic, 0, 0);
    pic.resize(width, height);
  } else {
    image(tmp, 0, 0);
    tmp.resize(width, height);
  }
}
void keyPressed() {
  if (key == 'r') {
    pic = loadImage("art.jpg");
  }
  if (key == 'e') {
    pic = edge(pic);
  }
  if (key == 'g') {
    gcount++;
  }
  if (key == 'm') {
    pic = mirror(pic);
  }
  if (key == 'l') {
    pic = repeatx(pic);
  }
  if (key == 'k') {
    pic = repeaty(pic);
  }
}
PImage gray(PImage img) {
  tmp = createImage(img.width, img.height, RGB);
  for (int i =0; i<img.pixels.length; i++) {
    tmp.pixels[i] = color(brightness(img.pixels[i]));
  }
  return tmp;
}
PImage edge(PImage img) {//changes pic to grayscale
  img.filter(GRAY);
  tmp = createImage(img.width, img.height, RGB);
  for (int y = 1; y < tmp.height-1; y++) {   // Skip top and bottom edges
    for (int x = 1; x < tmp.width-1; x++) {  // Skip left and right edges
      float sum = 128;
      for (int ky = -1; ky <= 1; ky++) {
        for (int kx = -1; kx <= 1; kx++) {
          int pos = (y + ky)*tmp.width + (x + kx);
          float val = blue(img.pixels[pos]);
          sum += kernel[ky+1][kx+1] * val;
        }
      }
      tmp.pixels[y*tmp.width + x] = color(sum);
    }
  }
  img = tmp;
  return img;
}
PImage mirror (PImage img) {
  tmp = new PImage(width, height);
  for (int y=0; y<height; y++) {
    for (int x=0; x<width; x++) {
      if (count % 2 == 0) {
        int i = x+(y*width);
        int o = width-x-1;
        int e = o+(y*width);
        if (x>width/2) {
          tmp.pixels[i] = color(img.pixels[e]);
        }
        if (x<=width/2) {
          tmp.pixels[i] = img.pixels[i];
        }
      } else {
        int i = x+(y*width);
        if (y<height/2) {
          tmp.pixels[i] = img.pixels[i];
        } else {
          int distfrommid = (y-height/2)*width;
          int e = i - 2*distfrommid; //??
          //int e = i-((1+y-height/2)*width);//all same row
          tmp.pixels[i] = color(img.pixels[e]);
        }
      }
    }
  }
  count++;
  img = tmp;
  return img;
}
PImage repeatx (PImage img) {
  tmp = new PImage(width, height);
  repcountx++;
  for (int y=0; y<height; y++) {
    for (int x=0; x<width; x++) {
      if (x>width/repcountx) {
        tmp.pixels[x+(y*width)] = color(img.pixels[(x-width/repcountx)+(y*width)]);
      } else {
        tmp.pixels[x+(y*width)] = color(img.pixels[x+(y*width)]);
      }
    }
  }
  img = tmp;
  return img;
}
PImage repeaty (PImage img) {
  tmp = new PImage(width, height);
  repcounty++;
  for (int y=0; y<height; y++) {
    for (int x=0; x<width; x++) {
      if (y>height/repcounty) {
        tmp.pixels[x+(y*width)] = color(img.pixels[x+(y*width)-(width*(height/repcounty))]);
      } else {
        tmp.pixels[x+(y*width)] = color(img.pixels[x+(y*width)]);
      }
    }
  }
  img = tmp;
  return img;
}
