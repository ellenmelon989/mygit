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
    stroke (255);
    if (numPoints > i) {
      line (xs[i], ys[i], xs[i+1], ys[i+1]);
    }
  }
}

void mousePressed() {
  numPoints++;
  xvals[numPoints] = mouseX;
  yvals[numPoints] = mouseY;
}
