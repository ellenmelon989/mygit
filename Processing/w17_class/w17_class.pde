Ball[] balls;
int score;
color SAFE_COLOR = color (0, 255, 255);
color COLLISION_COLOR = color (255, 0, 255);


void setup() {
  size(660, 400);
  background(0);
  score = 0;

  balls = new Ball[20];
  setupBalls();
}//setup

void draw() {
  background(0);
  for (int i=0; i<balls.length; i++) {
    balls[i].c = SAFE_COLOR;
    for (int j=0; j<balls.length-1; j++) {
      if ((balls[i].collisionCheck(balls[j])) == true) {
        balls[i].c = COLLISION_COLOR;
      }
    }
    balls[i].display();
    balls[i].move();
  }
}//draw

void setupBalls() {
  for (int i=0; i<balls.length; i++) {
    balls[i] = new Ball();
  }//loop through array, creating new Ball objects
}//setupBalls

void changeAllSpeeds() {
  int changex, changey;
  for (int i=0; i<balls.length; i++) {
    changex = int(random(-5, 6));
    changey = int(random(-5, 6));

    balls[i].changeSpeed(changex, changey);
  }
}//changeAllSpeeds


void keyPressed() {
  if (key == ' ') {
    for (int i=0; i<balls.length; i++) {
      balls[i].reset();
    }
  }//reset'
  else if (key == 'w') {
    changeAllSpeeds();
  }
  else if (key == CODED) {
    int xchange = 0;
    int ychange = 0;
    if (keyCode == UP) {
      ychange = -1;
    }//up
    else if (keyCode == DOWN) {
      ychange = 1;
    }//down
    else if (keyCode == LEFT) {
      xchange = -1;
    }//left
    else if (keyCode == RIGHT) {
      xchange = 1;
    }//right
    for (int i=0; i<balls.length; i++) {
      balls[i].changeSpeed(xchange, ychange);
    }
  }//non ASCII keys
}

void mousePressed() {
  for (int i=0; i<balls.length; i++) {
    if ( balls[i].onBall(mouseX, mouseY) ) {
      score+= balls[i].getScoreValue();
      balls[i].reset();
      println("Score: " + score);
    }//hit
  }
}//mousePressed
