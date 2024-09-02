int[] xvals;
int[] yvals;
int numPoints;

void setup() {
  size (600, 400);
  background (0);
  xvals = new int[100];
  yvals = new int[100];
  numPoints = 0;
  makeLines (xvals, yvals, 10);
  drawLines (xvals, yvals);
}

void makeLines (int[] xs, int[] ys, int points) {
  while (points > 0) {
    points --;
    if (points < xs.length) {
      xs[points] = int(random(width));
    }
    if (points < ys.length) {
      ys[points] = int(random(height));
    }
    numPoints++;
  }
  println (xs);
  println (ys);
}

void drawLines (int[] xs, int[] ys) {
  for (int i = 0; i < xvals.length-1 && i < yvals.length-1; i++) {
    stroke (255);
    if (numPoints > i) {
      line (xs[i], ys[i], xs[i+1], ys[i+1]);
    }
  }
}
