int radius;
int lineCount;
int circleCount;

void setup() {
  size(600, 400);
  
  lineCount = 5;
  drawGrid(lineCount);
  
  circleCount = 6;
  radius = 25;
  circleRow(radius, height/2, circleCount, radius*2);
}//setup

void drawGrid(int numLines) {
  int spacingX = width/(numLines+1);
  int spacingY = height/(numLines+1);

  int x = spacingX;
  int y = spacingY;
  for (int count = 0; count < numLines; count ++){
    line(x, 0, x, height);
    line(0, y, width, y);
    x+= spacingX;
    y+= spacingY;
  } 
  
}//drawGrid



void circleRow(int startX, int startY, int numCircles, int d) {
  for ( int count = 0; count < numCircles; count ++) {
    circle(startX, startY, d);
    startX+= d;
  }
}//circleRow
