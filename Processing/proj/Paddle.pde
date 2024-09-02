class Paddle {
  int px, py, pheight, pwidth;
  
  Paddle (int x, int y, int w, int h){
    px = x; 
    py = y;
    pheight = h;
    pwidth = w;
  }
  void display() {
    fill(#BFACC8);
    stroke(0);
    rect (px, py, pwidth, pheight);
    noFill();
    noStroke();
  }
  void move() {
    px = mouseX - pheight/2;
  }
}
