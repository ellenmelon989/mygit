class Block {
  float rx, ry, rheight, rwidth;
  
  Block(float x, float y, float w, float h) {
    rx = x;
    ry = y;
    rheight = h;
    rwidth = w;
  }
  void display() {
    strokeWeight(3);
    stroke(#BFACC8);
    fill(#4A4063);
    rect (rx, ry, rwidth, rheight);
    noFill();
    noStroke();
  }
  void destroy() {
    rx = width;
    //visually destroy it hopefully null destroys it in computer
  }
}