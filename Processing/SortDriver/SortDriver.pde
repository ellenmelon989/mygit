 /*======================
  Controls:
  s: shuffle blocks, reset
  r: create new blocks, reset
  o: create new blocks in increasing size order, reset
  space: toggle looping mode on/off
  any other key: move forward one step in the current sorting algorithm
  This program will not run draw continuously. By default it will
  only run draw on a keyPress event (other than s, r, o, or space).
  Hitting space will revert to nromal draw behavior, or toggle between
  the two states.
  ======================*/

//constants
int BUBBLE = 0;
int SELECTION = 1;
int INSERTION = 2;

int MIN_BLOCK_SIZE = 5;
int NUM_BLOCKS = 50;

color SORTED = #00FFFF;
color UNSORTED = 255;
color CURRENT = #FFFF00;
color TEST = #FF00FF;
color SMALLEST = #00FF00;

//Driver variables
BlockRow blocks;
boolean ordered;
boolean stepwise;

void setup() {
  size(600, 600);
  background(0);
  frameRate(10);

  ordered = false;
  stepwise = true;

  blocks = new BlockRow(NUM_BLOCKS, BUBBLE, ordered);
  blocks.display();
  if (stepwise) {
    noLoop();
  }
}//setup

void draw() {
  background(0);
  blocks.display();
  displayInfo(0, 0);

  blocks.sort();
}//draw



void keyPressed() {
  if (key == 's') {
    blocks.shuffle();
  }//shuffle
  else if (key == '1') {
    blocks.algorithm = BUBBLE;
  }
  else if (key == '2') {
    blocks.algorithm=SELECTION;
  }
  else if (key == '3') {
    blocks.algorithm=INSERTION;
  }
  else if (key == 'r') {
    blocks.setupBlocks(false);
  }//reset
  else if (key == 'o') {
    blocks.setupBlocks(true);
  }//reset ordered
  if ( key == ' ') {
    stepwise = !stepwise;
    if (stepwise) {
      noLoop();
    }
    else {
      loop();
    }
  }
  if (stepwise) {
    redraw();
  }//look for next value
}//keyPressed


void displayInfo(int targetSize, int foundIndex) {
  fill(255);
  textSize(20);
  textAlign(LEFT, TOP);
  String s = "";
  s += "algorithm: " + blocks.algorithm + " ";
  s += "number of compares: " + blocks.compare + "  ";
  s += "number of swaps: " + blocks.swap;
  text(s, 0, 0);
}//displayInfo
