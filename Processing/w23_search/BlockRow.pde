class BlockRow {
  Block[] row;

  int numBlocks;
  int minBlockSize;
  int maxBlockSize;

  BlockRow(int nb) {
    numBlocks = nb;
    minBlockSize = MIN_BLOCK_SIZE;
    maxBlockSize = 0;

    row = new Block[numBlocks];
    setupBlocks();
  }//setup

  void setupBlocks() {
    int x = 5;
    int y = 25;
    int topSize = minBlockSize;
    for (int i=0; i < row.length; i++) {
      topSize = (width - x) / (row.length - i);
      int bsize = int(random(minBlockSize, topSize));
      if (maxBlockSize < bsize) {
        maxBlockSize = bsize;
      }//keep maxBlockSize up to date
      row[i] = new Block(x, y, bsize);
      x+= bsize + 2;
    }//array loop
  }//setupBlocks

  void display() {
    for (int i=0; i < row.length; i++) {
      row[i].display();
    }//array loop
  }//viewBlocks

  void setBlockColor(int i, color c) {
    row[i].inside = c;
  }//resetBlockColor

  int find(int targetSize) {
    for (int i=0; i<row.length; i++) {
      if (row[i].sideLength == targetSize) {
        return i;
      }
    }
    return -1;
  }//findBlock

}//BlockRow
