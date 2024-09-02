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
boolean notPause;

void setup() {
  size(1000,800);
  background (0);
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

/*void showB(Block[][] b) {
  for (int i=0; i<b.length;i++) {
    for (int k=0; k<b[i].length; k++) {
      b[i][k].display();
    }
  } 
}*/

void mousePressed() {
  //blocks[0][0] = null;
  notPause = !notPause;
  //a.display();
}

void keyPressed() {
  if (key == ' ') {
    a.startMove();
    count = 1;
  }
  if (key == 'r') {
    setup();
  }
  if (key == 'c') {
    a.changeColor();
  }
  if (key == 'w') {
    a.increaseSpeed();
  }
  if (key == 's') {
    a.decreaseSpeed();
  }
}

void eraseBack() {
  background(0);
  for (int i=0; i<blocks.length;i++) {
    for (int k=0; k<blocks[i].length; k++) {
      blocks[i][k].display();
    }
  }
}

void bounceBall() {
  if (ballX-dia/2 <= 0 || ballX+dia/2 >= width) {
    a.xvel *= -1;
  }
  for (int i=0; i<blocks.length;i++) {
    for (int k=0; k<blocks[i].length; k++) {
      if (ballY-dia/2 <= blocks[i][k].ry+bheight) {
        if (ballX-dia/2 >= blocks[i][k].rx && ballX+dia/2 <= blocks[i][k].rx+bwidth) {
        a.yvel *= -1;
        blocks[i][k].destroy();//moves whole row and ball still bounces there
      }}
    }
  }
  if (ballY > paddleY+dia/2) {
    notPause = false;
  }
  if (ballX-dia/2 >= paddleX && ballX +dia/2 <= paddleX+bwidth){
    if (ballY+dia/2 >= paddleY) {
      a.yvel *= -1;
    }
  }
}

/*void checkBlocks() {
  for (int i=0; i<blocks.length;i++) {
    for (int k=0; k<blocks[i].length; k++) {
      
}*/
