class Orb {

  PVector position;
  PVector velocity;
  PVector acceleration;
  int size;
  float mass;
  color c;
  boolean north;
  float charge;
  float perm;
  float time = 3;
  float current;

  Orb(int x, int y, int s, float m) {
    position = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    size = s;
    mass = m;
    c = color(random(256), random(256), random(256));
    perm = (4*PI)/10000000;
    int n = int(random(10, 10000));
    charge = n*(1.6/1000000000);
    north = random(1) < 0.5;
  }//constructor

  void run(boolean bounce, float damp) {
    velocity.add(acceleration);
    velocity.mult(damp);
    position.add(velocity);
    acceleration.mult(0);

    if (bounce) {
      yBounce();
      xBounce();
    }
  }//run

  PVector getSpring(Orb o, int springLength, float springK) {
    float d = position.dist(o.position);
    float displacement = d - springLength;
    float magnitude = displacement * springK;

    PVector direction = PVector.sub(o.position, this.position);
    direction.normalize();
    direction.mult(magnitude);
    return direction;
  }//getSpring

  PVector getGravity(Orb o, float G) {
    if (o != this) {
      float d = this.position.dist(o.position);
      d = constrain(d, 5, 100);
      float mag = (G * mass * o.mass) / (d * d);
      PVector direction = PVector.sub(o.position, this.position);
      direction.normalize();
      direction.mult(mag);
      return direction;
    }
    return new PVector(0, 0);
  }//getGravity
  
  /*PVector getFriction() {
    
  }
  
  PVector getMagnetic(Orb o) {
    
  }*/

  float getDensity() {
    return mass/size;
  }//getDensity

  void applyForce(PVector f) {
    PVector newf = f.copy();
    newf.div( mass );
    acceleration.add(newf);
  }//applyForce

  void yBounce() {
    if (position.y < size/2) {
      position.y = size/2;
      velocity.y *= -1;
    }
    else if (position.y >= (height-size/2)) {
      position.y = height - size/2;
      velocity.y *= -1;
    }
  }//yBounce

  void xBounce() {
    if (position.x < size/2) {
      position.x = size/2;
      velocity.x *= -1;
    }
    else if (position.x >= width - size/2) {
      position.x = width - size/2;
      velocity.x *= -1;
    }
  }//xBounce

  boolean checkYBoundry() {
    boolean check = position.y >= height - size/2;
    check = check || (position.y <= size/2);
    return check;
  }
  boolean checkXBoundry() {
    boolean check = position.x >= width - size/2;
    check = check || (position.x <= size/2);
    return check;
  }

  void display() {
    int t = int(map(getDensity(), MIN_MASS/MAX_SIZE, MAX_MASS/MIN_SIZE, 100, 255));
    fill(c, t);
    circle(position.x, position.y, size);
  }//display

}//OrbNode
