float sec, hr, min, hrAngle, secAngle, minAngle;
int xCenter, yCenter, radius;

void setup () {
  size (600,600);
  background (94,77,88);
  sec = second ();
  min = minute();
  hr = hour();
  frameRate (1);
  xCenter = width/2;
  yCenter = height/2;
}
void draw () {
  clockFace (xCenter, yCenter, 500);
  updateTime ();
  drawHand (xCenter, yCenter, 120, 210, 210);
 // drawHand (xCenter, yCenter, min);
  //drawHand (xCenter, yCenter, sec);
}

void clockFace (int xOffset, int yOffset, int radius) {
  strokeWeight (2);
  circle (xOffset, yOffset, radius);
}
void updateTime () {
  if (sec % 59 == 0) {
    min ++;
    sec = 0;
  }
  if (min % 59 == 0 && sec % 59 == 0) {
    hr++;
    min = 0;
  }
  if (hr == 12) {
    hr = 0;
  }
  sec++;
  println(sec, min, hr);
}
float timetoAngle (String time) {
  if (time == "hr") {
    float hrAngle = (hr*30)-90;
    return radians (hrAngle);
  }
  else if (time == "min") {
    float minAngle = (min*6)-90;
    return radians (minAngle);
  }
  else if (time == "sec") {
    float secAngle = (sec*6)-90;
    return radians (secAngle);
  }
  return 0;
}
void drawHand (int xCenter, int yCenter, int hLength, int mLength, int sLength) {
  strokeWeight (7);
  stroke (0);
  line (xCenter, yCenter, xCenter+ hLength* cos(timetoAngle("hr")), yCenter+ hLength* sin(timetoAngle("hr")));
  strokeWeight (4);
  stroke (0);
  line (xCenter, yCenter, xCenter+ mLength* cos(timetoAngle("min")), yCenter+ mLength* sin (timetoAngle("min")));
  strokeWeight (3);
  stroke (255, 0, 0);
  line (xCenter, yCenter, xCenter+ sLength* cos (timetoAngle("sec")), yCenter+ sLength* sin(timetoAngle("sec")));
  stroke (0);
}
