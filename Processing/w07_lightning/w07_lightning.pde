void drawLightning (int x, int y, int numParts) {
  while (numParts > 0) {
    int nextx = int (random (x-5, x+5));
    int nexty = y+ height/numParts;
    stroke (#FFFF00);
    strokeWeight (7);
    line (x, y, nextx, nexty);
    x = nextx;
    y = nexty;
    numParts = numParts-1;
  }
}
void setup () {
  size (400, 400);
  background (0);
  int lightning = 5;
  while (lightning > 0) {
    drawLightning (int (random (width)), int (random (height)), int (random (10,100)));
    lightning = lightning-1;
  }
}
