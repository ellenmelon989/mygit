int angle; //The degree angle we will use for sin() and cos() functions.
int dotDiameter;//The size of the circle that will be graphing.

int sinAmplitude;
int circRadius;
int spiralRadius;

void setup() {
  frameRate(120);
  size(600, 600);
  background(0);
  dotDiameter = 4;
  sinAmplitude = 100;
  circRadius = 100;
  spiralRadius = 100;
  angle = 0;
  stroke(255);
}//setup

void draw() {
  //background(0);
  //sin curve
  drawSinCurve(angle, sinAmplitude, sinAmplitude);
  //circle
  drawCircle(angle, circRadius, width/2, sinAmplitude*2 + circRadius);
  //concentric circles
  drawCircle(angle, spiralRadius, width/2, sinAmplitude*2 + circRadius*3);
  if (angle != 0 && angle % 360 == 0){
    spiralRadius -= 2 * dotDiameter;
  }
  angle++;
}//draw

void drawSinCurve(int degrees, int amplitude, float yOffset) {
  int x = angle % width;
  yOffset = amplitude*(sin(radians(degrees))) + yOffset;
  circle (x, yOffset, dotDiameter);
}
void drawCircle(int degrees, int radius, int xOffset, int yOffset) {
  float x, y;
  x = cos(radians(degrees)) * radius;
  y = sin(radians(degrees)) * radius;
  circle(x + xOffset, y + yOffset, dotDiameter);
}
