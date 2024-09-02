float angle, spiralAngle, xOffset, yOffset;
int dotDiameter;
int sinAmplitude;
int circRadius;
int spiralRadius;
int petalRadius;

void setup() {
  size(600, 600);
  background(0);
  frameRate(200);

  dotDiameter = 4;
  sinAmplitude = 100;
  circRadius = 100;
  spiralRadius = 100;
  petalRadius = 100;
  angle = 0;
  spiralAngle = 0;
  stroke(20);
}//setup

void draw() {
  changeColor();
  drawPattern(angle, petalRadius, sinAmplitude*3, circRadius*3);
  otherGraph (angle, sinAmplitude, xOffset, yOffset);
  drawSpiral(xOffset, yOffset, angle);
  angle += 0.05;
}

void drawPattern(float degrees, float radius, float xOffset, float yOffset) {
  xOffset = 3*radius * cos(radians(4 * degrees)) + xOffset;
  yOffset = 3*radius * sin(radians(11 * degrees)) + yOffset;
  circle(xOffset, yOffset, dotDiameter);
}

void changeColor() {
  if (frameCount % 100 == 0) {
    int randomR = int(random(0, 255));
    int randomG = int(random(0, 255));
    int randomB = int(random(0, 255));
    stroke(randomR, randomG, randomB);
  }
}
void otherGraph (float degrees, int r, float x, float y) {
  xOffset = width/2;
  yOffset = height/2;
  y = r * sin (sinAmplitude *(radians (degrees)))* sin(radians(degrees));
  x = r * cos(radians(degrees)) * cos (sinAmplitude * (radians (degrees)));
  circle (x+xOffset, y + yOffset, dotDiameter);
}

void drawSpiral(float xOffset, float yOffset, float radius) {
  xOffset=width/2;
  yOffset=height/2;
  float xSpiral=xOffset+radius*cos(radians(spiralAngle/3));
  float ySpiral=yOffset+radius*sin(radians(spiralAngle/3));
  circle(xSpiral,ySpiral,dotDiameter);
  spiralAngle++;
}
