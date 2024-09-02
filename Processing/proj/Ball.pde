class Ball {
  int cx, cy, diameter, xvel, yvel;
  color c;
  
  Ball(int x, int y, int d) {
    cx = x;
    cy = y;
    diameter = d;
    c = (255);
  }
  void display() {
    fill(c);
    circle (cx, cy, diameter);
    noFill();
  }
  void startMove() {
    xvel = int (random(1, PI));
    yvel = -1;
  }
  void bMove() {
    cx += xvel;
    cy += yvel;
  }
  void changeColor() {
    c = color (random(255), random(255), random(255));
  }
  void increaseSpeed() {
    xvel = xvel*2;
    yvel = yvel*2; 
    if (xvel == 0) {
      xvel = 1;
    }
    if (yvel == 0) {
      yvel = 1;
    }
  }
  void decreaseSpeed() {
    xvel = xvel/2;
    yvel = yvel/2;
  }
}
