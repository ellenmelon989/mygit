Block[][] blocks;
Ball a;
Paddle p;
int count;
int numRows = 5;
int numCols = 10;
int bwidth, bheight;
int dia = 20;
int ballX, ballY;
int paddleX, paddleY, paddleH, paddleW;
boolean notPause = true;
int lives = 3;
int speedCount = 0;

void setup() {
  size(1000,800);
  background (0);
  frameRate(120);
  blocks = new Block[numRows][numCols];
  setBlocks(blocks);
  paddleW = width/8;
  paddleH = height/50;
  paddleX = width/2-paddleW/2;
  paddleY = height-paddleH*2;
  p = new Paddle (paddleX, paddleY, paddleW, paddleH);
  p.display();
  ballX= width/2;
  ballY= paddleY - dia/2;
  a = new Ball(ballX, ballY, dia);
  a.display();
  println("lives left:", lives);
}

void draw() {
  eraseBack();
  p.display();
  paddleX = p.px;
  paddleY = p.py;
  a.display();
  ballX = a.cx;
  ballY = a.cy;
  bounceBall();
  if (notPause) {
    a.bMove();
    if (count != 0) {
      p.move();
    }
  }
  /*stroke(255,0,0);
  line (a.xvel+ballX, a.yvel+ballY, a.xvel*10+ballX, a.yvel*10+ballY);//visualize motion
  noStroke();*/
}

void setBlocks(Block[][] b) {
  bwidth = width/numCols;
  bheight = height/(numRows*2);
  for (int i=0; i<b.length;i++) {
    for (int k=0; k<b[i].length; k++) {
      b[i][k] = new Block(k*bwidth, i*bheight, bwidth, bheight);
      b[i][k].display();
    }
  }
}

void mousePressed() {
  a.startMove();
  count ++;
}

void keyPressed() {
  if (key == ' ') {
    notPause = !notPause;//changed start and pause 
  }
  if (key == 'r') {
    eraseBack();
    p.px = width/2-paddleW/2;
    p.py = height-paddleH*2;
    p.display();
    a.cx= width/2;
    a.cy= p.py - dia/2;
    a.display();
    count = 0;
    lives --;
    if (lives == 0){
      setup();
      lives = 3;
    }
    println("lives:", lives);
  }
  if (key == 'c') {
    a.changeColor();
  }
  /*if (key == 'w') {
    a.increaseSpeed();
  }
  if (key == 's') {
    a.decreaseSpeed();
  }*/
}

void eraseBack() {
  background(0);
  for (int i=0; i<blocks.length;i++) {
    for (int k=0; k<blocks[i].length; k++) {
      blocks[i][k].display();
    }
  }
}

boolean ballHitSideEdge() { //return
  if (ballX-dia/2 <= 0 || ballX+dia/2 >= width) {
    return true;
  }
  return false;
}
boolean ballHitTop() {
  if (ballY-dia/2 <= 0) {
    return true;
  } 
  return false;
}
boolean ballHitsBottom() {
  for (int i=0; i<blocks.length;i++) {
    for (int k=0; k<blocks[i].length; k++) {
      if (ballY-dia/2 == blocks[i][k].ry+bheight && a.yvel < 0) {
        if (ballX+dia/2 >= blocks[i][k].rx && ballX-dia/2 <= blocks[i][k].rx+bwidth) {
          blocks[i][k].destroy();
          return true;
        }
      }
    }
  }
  return false;
}
boolean ballHitTopBlock() {
  for (int i=0; i<blocks.length;i++) {
    for (int k=0; k<blocks[i].length; k++) {
      if (ballY+dia/2 == blocks[i][k].ry && a.yvel > 0) {
        if (ballX+dia/2 >= blocks[i][k].rx && ballX-dia/2 <= blocks[i][k].rx+bwidth) {
          blocks[i][k].destroy();
          return true;
        }
      }
    }
  }
  return false;
}

boolean ballHitLeft() {
  for (int i=0; i<blocks.length;i++) {
    for (int k=0; k<blocks[i].length; k++) {
      if (ballX+dia/2 == blocks[i][k].rx && a.xvel >0) {
        if (ballY-dia/2 <= blocks[i][k].ry+bheight && ballY+dia/2 >= blocks[i][k].ry) {
          blocks[i][k].destroy();
          return true;
        }
      }
    }
  }
  return false;
}
boolean ballHitRight() {
  for (int i = 0; i<blocks.length;i++) {
    for (int k = 0; k< blocks[i].length; k++) {
      if (ballY-dia/2 <= blocks[i][k].ry+bheight && ballY+dia/2 >= blocks[i][k].ry) {
        if (ballX-dia/2 == blocks[i][k].rx+bwidth && a.xvel <0) {
          blocks[i][k].destroy();
          return true;
        }
      }
    }
  }
  return false;
}
boolean ballHitPaddle() {
  if (ballX-dia/2 >= paddleX && ballX +dia/2 <= paddleX+bwidth){
    if (ballY+dia/2 >= paddleY) {
      if (count != 0){
        return true;
      }
    }
  }
  return false;
}
void bounceBall() {
  if (ballHitSideEdge()) {
    a.xvel *= -1;
  }
  if (ballHitTop() || ballHitsBottom() || ballHitTopBlock()) {
    a.yvel *= -1;
  }
  if (ballHitRight()) {
    a.xvel = abs(a.xvel);
  }
  if (ballHitLeft()) {
    a.xvel = abs(a.xvel)*-1;
  }
  if (ballHitPaddle()) {
    a.yvel = abs(a.yvel)*-1;
    if (ballX-dia/2 >= paddleX+paddleW/2 && ballX <= paddleX+paddleW) {
      a.xvel = abs(a.xvel);
    }
    else if (ballX + dia/2 < paddleX+paddleW/2 && ballX >= paddleX) {
      a.xvel = abs(a.xvel) *-1;
    }
  }
  if (ballY > paddleY+dia) {
    notPause = false;
    a.yvel = -1;
  }
}
//powerups: lengthen paddle
