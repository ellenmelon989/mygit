/* ===================
 Ball Class
 You do not need to modify any of this code.
 You may need to look at the methods and instance
 variables in order to complete parts of the assignment.
 =================== */

class Ball {

  int cx, cy;
  int xvelocity, yvelocity;
  int radius;

  //constructor
  Ball() {
    radius = BALL_SIZE;
    reset();
  }//default constructor

  Ball(int x, int y) {
    radius = BALL_SIZE;
    cx = x;
    cy = y;
    xvelocity = int(random(5)+1) * (-1 * int(random(2+1)));
    yvelocity = int(random(5)+1) * (-1 * int(random(2+1)));
  }//position constructor

  void reset() {
    cx = width/2;
    cy = height/2;
    xvelocity = int(random(5)+1) * (-1 * int(random(2)+1));
    yvelocity = int(random(5)+1) * (-1 * int(random(2)+1));
  }//resetBall

  void display() {
    circle(cx, cy, radius * 2);
  }//display

  void move() {
    if (cx <= radius || cx >= (width - 1 - radius)) {
      xvelocity*= -1;
    }//x bounce
    if (cy <= radius || cy >= (height - 1 - radius)) {
      yvelocity*= -1;
    }//x bounce
    cx+= xvelocity;
    cy+= yvelocity;
  }//moveBall

  void xbounce() {
    xvelocity*= -1;
    cx += xvelocity;
  }//xbounce

  void ybounce() {
    yvelocity*= -1;
    cy += yvelocity;
  }//ybounce

  void changeSpeed(int x, int y) {
    xvelocity+= x;
    yvelocity+= y;
  }//changeSpeed

  boolean onBall(int x, int y) {
    float d = dist(x, y, cx, cy);
    return d <= radius;
  }//onBall

  int getScoreValue() {
    int score = abs(xvelocity) + abs(yvelocity);
    return score;
  }//getScoreValue

}//Ball
