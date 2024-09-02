float GRAVITY = 0.4;
int MAX_SIZE  = 50;
int MIN_SIZE = 10;
float MAX_MASS = 10;
float MIN_MASS = 1;
float DAMPENING = 1;//0.996;

float SPRING_CONST = 0.005;
int SPRING_LENGTH = 100;
int NUM_ORBS = 10;

boolean moving;
boolean bounce;
boolean grav;
boolean spring;
boolean friction;
boolean magnet;
boolean combo;

Orb[] orbs;
FixedOrb earth;
OrbNode o0, o1, o2;

void setup() {
  size(600, 600);
  background(255);
  reset();
  earth = new FixedOrb(width/2, height*10, 25, 5);
}//setup

void draw() {

  background(255);
  displayMode();
  /*OrbNode current = o0;
  while (current != null) {
    current.display(SPRING_LENGTH);
    current.applySprings(SPRING_LENGTH, SPRING_CONST);
    if (moving) {
      current.run(bounce, DAMPENING);
    }//moving
    current = current.next;
  }*/
}//draw

void drawSpring(Orb o0, Orb o1) {
  line(o0.position.x, o0.position.y, o1.position.x, o1.position.y);
  stroke(0);
}//drawSpring

void reset() {
  moving = false;
  bounce = false;
  grav = false;
  spring = false;
  friction = false;
  magnet = false;
  combo = false;

  /*o0 = new OrbNode(int(random(15, width - 15)), int(random(15, height - 15)), 15, 5);
  o1 = new OrbNode(int(random(15, width - 15)), int(random(15, height - 15)), 15, 5);
  o2 = new OrbNode(int(random(15, width - 15)), int(random(15, height - 15)), 15, 5);

  o0.next = o1;
  o1.next = o2;
  o2.previous = o1;
  o1.previous = o0;*/
}//reset


void keyPressed() {
  if (key == ' ') {
    moving = !moving;
  }
  if (key == 'b') {
    bounce = !bounce;
  }
  if (key == 'g') {
    grav = !grav;
  }
  if (key == 's') {
    spring = !spring;
  }
  if (key == 'f') {
    friction = !friction;
  }
  if (key == 'm') {
    magnet = !magnet;
  }
  if (key == 'c') {
    combo = !combo;
  }
  if (key == 'r') {
    reset();
  }
  if (key == 'h') {
    resetHorizontal();
  }
}//keyPressed

void resetHorizontal() {
  moving = false;
  bounce = false;
  grav = false;
  spring = false;
  friction = true;
  magnet = false;
  background(200);
  int x = 10;
  int y = 60;
  for (int i=0; i<orbs.length; i++) {
    int s = int(random(MIN_SIZE, MAX_SIZE));
    float m = random(MIN_MASS, MAX_MASS);
    x+= s/2;
    orbs[i] = new Orb(x, y, s, m);
    x+= s/2 + 10;
  }
}//resetHorizontal

void displayMode() {
  //initial setup
  color c;
  textAlign(LEFT, TOP);
  textSize(15);
  noStroke();
  //red or green boxes
  c = moving ? color(0, 255, 0) : color(255, 0, 0);
  fill(c);
  rect(0, 0, 53, 20);
  c = bounce ? color(0, 255, 0) : color(255, 0, 0);
  fill(c);
  rect(54, 0, 57, 20);
  c = grav ? color(0, 255, 0) : color(255, 0, 0);
  fill(c);
  rect(112, 0, 120, 20);
  c = spring ? color(0, 255, 0) : color(255, 0, 0);
  fill(c);
  rect(234, 0, 55, 20);
  c = friction ? color(0, 255, 0) : color(255, 0, 0);
  fill(c);
  rect(291, 0, 65, 20);
  c = magnet ? color(0, 255, 0) : color(255, 0, 0);
  fill(c);
  rect(359, 0, 65, 20);
  c = combo ? color(0, 255, 0) : color(255, 0, 0);
  fill(c);
  rect(426, 0, 55, 20);
  stroke(0);
  fill(0);
  text("MOVING", 1, 0);
  text("BOUNCE", 55, 0);
  text("NORMAL GRAVITY", 113, 0);
  text("SPRING", 235, 0);
  text("FRICTION", 292, 0);
  text("MAGNETS", 360, 0);
  text("COMBO", 427, 0);
}
