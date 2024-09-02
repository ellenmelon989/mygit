class FixedOrb extends Orb {

  FixedOrb(int x, int y, int s, float m) {
    super(x, y, s, m);
    c = color(0);
  }//constructor

  //fixed orbs do not move at all
  void run(boolean bounce, float d) {
  }//run

  //dont do the transparency/denisity calculation
  void display() {
    fill(c);
    circle(position.x, position.y, size);
  }//display

}//FixedOrb
