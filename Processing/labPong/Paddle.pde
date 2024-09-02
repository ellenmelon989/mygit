class Paddle {

  /* ===================
   Instance variables
   A Paddle should know the coordinates of
   its upper-left corner, as well as its
   width and height.
   Create instance variables to store this information.
   =================== */
   int pcx, pcy, pw, ph;

  /* ===================
   Default Constructor
   Set the corner of the paddle to (0, 0) and
   the size of the paddle to the PADDLE_WIDTH
   and PADDLE_HEIGHT global constants defined
   in PongDriver.
   =================== */
  Paddle() {
    pcx = 0; 
    pcy = 0;
    pw = PADDLE_WIDTH;
    ph = PADDLE_HEIGHT;
  }//default constructor

  /* ===================
   Position constructor
   Write a constructor that takes a single parameter that
   represents the value the x coordinate of the corner shold
   be.
   It should set the size of the ball the same way the
   default constructor does.
   The corner should be set such that:
    0) The paddle should be centered vertically on the screen.
    1) The x value should be the value of the parameter passed in.
   =================== */
  Paddle(int xoffset) {
    pcx = xoffset;
    pcy = 0;
    pw = PADDLE_WIDTH;
    ph = PADDLE_HEIGHT;
  }//x offset constructor

  /* ===================
   void display()
   Draw a rectangle using the instance vairables.
   =================== */
  void display() {
    fill (255);
    rect (pcx, pcy, pw, ph);
  }//display

  /* ===================
   void move(int x)
   Set the y value of the corner of the paddle
   to the provided parameter.
   =================== */
  void move(int y) {
    pcy = y;
  }//move

  /* ===================
   boolean hitRight(Ball b)
   Should return true if the Ball parameter is hitting
   the right side of the paddle.
   =================== */
  boolean hitRight(Ball b) {
    return pcx+pw+b.radius == b.cx && b.cy >= pcy && b.cy <= pcy+ph;
  }//hitLeft
  
  boolean hitLeft(Ball b) {
    return pcx-b.radius == b.cx && b.cy >= pcy && b.cy <= pcy+ph;
  }

}//Paddle
