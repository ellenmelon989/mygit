//State variable constants
int DIRT = 0;
int FIRE = 1;
int BURNT = 2;
int GRASS = 3;

//Helpful color values
color DIRT_COLOR = #81582F;
color FIRE_COLOR = #F20C0C;
color BURNT_COLOR = #810707;
color GRASS_COLOR = #49B90D;

//Driver variables
boolean burning = false;
int grassDensity = 75;
int numTracts = 10;
int tractLength = 20;
Land[][] grid;


void setup() {
  size(700, 350);
  frameRate(5);
  grid = new Land[numTracts][tractLength];
    setupLand(grid, numTracts, tractLength, grassDensity);
    showLand(grid);
}//setup

void draw() {
    showLand(grid);
  if (burning) {
    for (int r=0; r < grid.length; r++) {
      liveFire(grid[r]);
    }
  }//burning
}//draw


void setupLand(Land[][] field, int numRows, int numPlots, float density) {
  //figure out size of each plot of land
  int plotSize = width/numPlots;
  int pheight = height/numRows;
  //instantiate each Land object
  for (int i=0; i<field.length; i++) {
    for (int k=0; k<field[i].length; k++) {
    int type = DIRT;

    //first Land object should be FIRE
    if (k == 0) {
      type = FIRE;
    }//start with fire

    //Chance for grass is based on density
    else if (random(100) < density) {
      type = GRASS;
    }//grass land

    //creates a new land at (x, y) with size plotSize and type
    field[i][k] = new Land(k*pheight, i*plotSize, plotSize, type);
    }
  }//setup loop
}//setupLand

  void showLand(Land[][] field) {
  for (int i=0; i<field.length; i++) {
    for (int k=0; k<field[i].length; k++) {
      field[i][k].display();
    }
  }
}//showLand


void liveFire(Land[] row) {
  //First, check Land objects to the left, apply state change rules.
  //Assume nothing useful to the left of row[0]
  row[0].updateNextState(0);
  for (int i=1; i<row.length; i++) {
    row[i].updateNextState(row[i-1].state);
  }//set nextStates for all plots

  //Based on potential state changes from updateNextState
  for (int i=0; i<row.length; i++) {
    row[i].changeState();
  }//change states
}//liveFire





void keyPressed() {
  if (key == ' ') {
    burning = !burning;
  }//start burning
  else if (key == 'r') {
    burning = false;
      setupLand(grid, numTracts, tractLength, grassDensity);
  }
}
