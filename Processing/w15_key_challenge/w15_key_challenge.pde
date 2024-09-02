int[] xvals;
int[] yvals;
int numPoints;

void setup() {
  size (600, 400);
  background (0);
  xvals = new int[100];
  yvals = new int[100];
  numPoints = 0;
  drawLines (xvals, yvals);
}

void draw() {
  background (0);
  drawLines (xvals, yvals);
}

void drawLines (int[] xs, int[] ys) {
  for (int i = 0; i < xvals.length-1 && i < yvals.length-1; i++) {
    if (numPoints > i) {
      line (xs[i], ys[i], xs[i+1], ys[i+1]);
    }
  }
}

void moveLines (int[] xs, int[] ys, int xMod, int yMod) {
  for (int i = 0; i < xs.length && i < ys.length; i++) {
    xs[i] = xs[i] + xMod;
    ys[i] = ys[i] + yMod;
  }
}

void mousePressed() {
  numPoints++;
  stroke(255);
  xvals[numPoints] = mouseX;
  yvals[numPoints] = mouseY;
}

void keyPressed() {
  println (key);
  if (key == 'c') {
    background (0);
    numPoints = 0;
  }
  if (key == 'r') {
    stroke (random(255), random(255), random(255));
  }
  if (key == 't') {
    strokeWeight (random (100));
  }
  if (key == CODED) {
    if (keyCode == UP) {
      moveLines (xvals, yvals, 0, -1);
    }
    else if (keyCode == DOWN) {
     moveLines (xvals, yvals, 0, 1); 
    }
  }
}
