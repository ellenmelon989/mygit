//constants
int MIN_BLOCK_SIZE = 5;

//Driver variables
BlockRow blocks;
int numBlocks;
int searchSize;
int foundBlock;

void setup() {
  size(600, 200);
  background(0);

  numBlocks = 20;
  searchSize = MIN_BLOCK_SIZE;
  foundBlock = -1;

  blocks = new BlockRow(numBlocks);
  blocks.display();
}//setup

void draw() {
  background(0);
  blocks.display();
  lookFor(searchSize);
}//draw

void keyPressed() {
  if (foundBlock != -1) {
    blocks.setBlockColor(foundBlock, color(255));
  }//found block reset color
  searchSize = (searchSize+1);
}//keyPressed

void lookFor(int targetSize) {
  foundBlock = blocks.find(targetSize);
  if (foundBlock != -1) {
    blocks.setBlockColor(foundBlock, color(255, 255, 0));
  }//change found block color
  displayInfo(targetSize, foundBlock);
}//lookFor

void displayInfo(int targetSize, int foundIndex) {
  fill(255);
  textSize(20);
  textAlign(LEFT, TOP);
  text("Looking for size: " + searchSize + " Found at: " + foundIndex, 0, 0);
}//displayInfo
