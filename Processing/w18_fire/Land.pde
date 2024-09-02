class Land {
  
  int state, nextState, landSize, lx, ly;
  color landColor;
  
  Land() {
    landSize = width/tractLength;
    nextState = state;
  }
  
  Land (int x, int y, int lSize, int rstate) {
    landSize = lSize;
    lx = x;
    ly = y;
    state = rstate;
  }
  
  void updateNextState(int k) {
    if (k == FIRE) {
      if (this.state == FIRE) {
        this.nextState = BURNT;
      }
      if (this.state == GRASS) {
        this.nextState = FIRE;
      }
      else {
        this.nextState = this.state;
      }
    }
  }
  
  void display() { 
    if (state == DIRT) {
      landColor = DIRT_COLOR;
    }
    else if (state == FIRE) {
      landColor = FIRE_COLOR;
    }
    else if (state == BURNT) {
      landColor = BURNT_COLOR; 
    }
    else if (state == GRASS) {
      landColor = GRASS_COLOR;
    }
    fill(landColor);
    square(lx, ly, landSize);
  }
  
  void changeState() {
    state = nextState;
  }
}
