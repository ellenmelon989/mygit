class OrbNode extends Orb {

  OrbNode next;
  OrbNode previous;

  OrbNode(int x, int y, int s, float m) {
    super(x, y, s, m);
  }//constructor
  void display(int springLength) {
    this.display();
    color sprC;
    if (next != null) {
      int d = int(this.position.dist(next.position));
      if (d>springLength) {
        sprC = color(255, 0, 0);
      } else if (d < springLength) {
        sprC = color(0, 255, 0);
      }
      line (this.position.x, this.position.y, next.position.x, next.position.y);
    }
  }
  void applySprings(int springLength, float springK) {
    if (next != null) {
      PVector f = this.getSpring(next, springLength, springK);
      PVector g = next.getSpring(this, springLength, springK);
      this.applyForce(f);
      next.applyForce(g);
    }
    if (previous != null) {
      PVector a = this.getSpring(previous, springLength, springK);
      PVector b = previous.getSpring(this, springLength, springK);
      this.applyForce(a);
      previous.applyForce(b);
    }
  }
}//class OrbNode
