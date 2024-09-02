class BlockRow {
  Block[] row;

  int numBlocks;
  int minBlockSize;
  int maxBlockSize;
  int algorithm;
  boolean sorted;

  //variables for bubble sort keep track of
  //start of the sorted portion
  //two test positions to compare
  int sortedStart;
  int testPos0;
  int testPos1;
  int compare;
  int swap;

  //selection vars
  int currentPos;
  int smallestPos;
  int testPos;

  //insertion
  int sortedEnd;
  int newValue;

  BlockRow(int nb, int algo, boolean orderd) {
    numBlocks = nb;
    minBlockSize = MIN_BLOCK_SIZE;
    algorithm = algo;
    sorted = ordered;

    setSortVars();

    row = new Block[numBlocks];
    setupBlocks(ordered);
  }//setup

  void setSortVars() {
    sortedStart=numBlocks;
    testPos0=0;
    testPos1=1;
    compare=0;
    swap=0;
    currentPos=0;
    smallestPos=0;
    testPos=1;
    //sortedEnd;
    //newValue;
  }//setSortVars

  void swap(int i0, int i1) {
    int left = row[i0].sideLength;
    row[i0].sideLength = row[i1].sideLength;
    row[i1].sideLength = left;
  }//swap

  void sort() {
    if (algorithm == BUBBLE) {
      bubbleSortOnce();
    }//bubble sort
    else if (algorithm == SELECTION) {
      selectionSortOnce();//selection sort
    } else if (algorithm == INSERTION) {
      //insertionSortOnce();//insertion sort
    }
  }//sort

  void bubbleSortOnce() {
    //if unsorted, keep going
    //if the sorted start is not at the beginning, there
    //is more sorting to do.
    if (sorted == false) { //!sorted?

      //if we arent at the end of unsorted portion,
      //keep moving along
      if (testPos0<sortedStart) {
        compare++;
        //if the 2 test values are out of order, swap!
        //when swapping values, don't forget to call rearrange()
        if (testPos1 == numBlocks) {
          testPos1 = 1;
        }
        if (row[testPos0].sideLength>row[testPos1].sideLength) {
          swap++;
          swap(testPos0, testPos1);
          rearrange();
        }//bubbling

        testPos0++;
        testPos1++;
        //move our test values over
      }//Not at the end

      //if we reach the end of the unsorted position,
      //change our index variables appropriately.
      if (testPos0==sortedStart-1) {
        sortedStart--;
        testPos0=0;
        testPos1=1;
      }//reset
    }//still sorting
  }//bubbleSortOnce

  void selectionSortOnce() {
    //if currentPos is at the end, done!

    if (!sorted) {

      //find smallest block in unsorted portion
      //how can we tell we are still looking for the smallest?
      if (testPos<row.length) {
        compare++;
        //compare value at smallestPos to testPos 
        /*if (testPos == row.length) {
          testPos = currentPos +1;
        }*/
        if (row[testPos].sideLength<row[smallestPos].sideLength) {
          smallestPos = testPos;

          //if value at testPos is smaller, update smallestPos
        }//test is smaller
        testPos ++;
        //move to the next element
      }//looking for smallest
      //found the smallest in the unsorted portion, swap!
      else {
        swap(smallestPos, currentPos);
        rearrange();
        swap++;
        currentPos++;
        testPos = currentPos +1;
        //don't forget to call rearrange() after swap
        //update sorting variables to prepare to
        //find the next smallest value
      }
    }//still sorting
  }//selectionSortOnce
  /*void insertionSortOnce() {
   //if the end of the sorted portion is
   //the end of the array, we're done!
   if ( UNSORTED ) {
   
   //store the new value we are inserting
   //in a new variable
   Block blockToInsert = null;
   
   //if the current position is in bounds, and the value at the
   //current position is bigger than the inserted value, shift over!
   if ( CONDITION ) {
   //shift the current value over one
   
   //put the inserted value in the current spot
   
   
   //update variables
   
   rearrange();
   }//shift down
   
   //if  we've reached the beginning of the array, or,
   //the inserted alue is in the right spot, reset
   //variables to start again.
   else {
   }//reset variables
   }//still sorting
   }//insertionSortOnce*/
  /*==================================
   LEAVE ALL OF THIS CODE ALONE.
   The code below this line is here to help
   run the program, it is all working, and
   does not need to be modified.
   ==================================*/


  void setupBlocks(boolean ordered) {
    maxBlockSize = 0;
    minBlockSize = MIN_BLOCK_SIZE;
    int topSize = 100;
    if (ordered) {
      topSize = 10;
    }
    for (int i=0; i < row.length; i++) {
      int bsize = int(random(minBlockSize, topSize));
      if (maxBlockSize < bsize) {
        maxBlockSize = bsize;
      }//keep maxBlockSize up to date
      row[i] = new Block(0, 0, bsize);
      if (ordered) {
        minBlockSize = bsize;
        topSize = minBlockSize+5;
      }//keep thigns ordered
    }//array loop
    rearrange();
    setSortVars();
  }//setupBlocks

  void rearrange() {
    int x = 5;
    int y = 25;
    int topSize = 0;
    for (int i=0; i < row.length; i++) {
      if (topSize < row[i].sideLength) {
        topSize = row[i].sideLength;
      }//update topSize
      if (x + row[i].sideLength >= width) {
        x = 5;
        y+= topSize + 5;
      }//new row
      row[i].move(x, y);
      x+= row[i].sideLength +2;
    }//array loop
  }//rearrange

  void display() {
    for (int i=0; i < row.length; i++) {
      if (algorithm == BUBBLE) {
        setBubbleColor(i);
      }//bubble sort color
      else if (algorithm == SELECTION) {
        setSelectionColor(i);
      }//selection sort coloring
      else if (algorithm == INSERTION) {
        setInsertionColor(i);
      }//insertion sort coloring
      row[i].display();
    }//array loop
  }//viewBlocks

  void setBubbleColor(int i) {
    color c;
    if (i >= sortedStart) {
      c = SORTED;
    }//sorted color
    else if (i == testPos0) {
      c = CURRENT;
    }//test color
    else if (i == testPos1) {
      c = TEST;
    }//test color
    else {
      c = UNSORTED;
    }//unsorted color
    row[i].inside = c;
  }//setBubbleColor

  void setSelectionColor(int i) {
    color c;
    if (i < currentPos) {
      c = SORTED;
    }//sorted color
    else if (i == currentPos) {
      c = CURRENT;
    }//test color
    else if (i == testPos) {
      c = TEST;
    }//test color
    else if (i == smallestPos) {
      c = SMALLEST;
    }//smallest color
    else {
      c = UNSORTED;
    }//unsorted color
    row[i].inside = c;
  }//setBubbleColor

  void setInsertionColor(int i) {
    color c;
    if (i == newValue) {
      c = SMALLEST;
    }//test color
    else if (i <= sortedEnd) {
      c = SORTED;
    }//sorted color
    else {
      c = UNSORTED;
    }//unsorted color
    row[i].inside = c;
  }//setBubbleColor

  void shuffle() {
    for (int i=0; i<row.length; i++) {
      int i0 = int(random(0, row.length));
      int i1 = int(random(0, row.length));
      swap(i0, i1);
    }//array loop
    rearrange();
    setSortVars();
    ordered = false;
  }//shuffle

  int getSize(int i) {
    if (i < row.length && i >= 0) {
      return row[i].sideLength;
    }//valid index
    return -1;
  }//getSize

  void setColor(int i, color c) {
    row[i].inside = c;
  }//setColor
}//BlockRow
