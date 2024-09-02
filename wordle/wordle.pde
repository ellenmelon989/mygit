//global constants
int rows = 6;
int cols = 5;
int BOX_HEIGHT = 80;
int BOX_WIDTH = 80;
int curRow = 0;
int curCol = 0;
boolean darkmode;
boolean ifword;
String[] guess;
String[] answers;
String test;
String ans;

//driver variables
Box[][] b;

void setup() {
  size(600, 750);

  answers = loadStrings("wordle_answer_words.txt");

  guess = loadStrings("wordle_guess_words.txt");

  b = new Box [rows][cols];

  boxPos();

  int r = int(random(answers.length));
  ans = answers[r];
}

void draw() {
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      b[i][j].display();
    }
  }
  for (int j = 0; j < cols; j++) {
    //char a[] ;
    //a = append (a, b[curRow][j].l.q);
    String cur = str((b[curRow][j].l.q));
    if (j == 0) {
      test = cur;
    }
    test += cur;
  }
  test = test.substring(1);
  if (Press() == true) {
    resetGame();
  }
}

void boxPos() {
  for (int i = 0; i < rows; i++) {
    int y = i * BOX_HEIGHT;
    for (int j = 0; j < cols; j++) {
      b[i][j] = new Box((i)*BOX_WIDTH, y, BOX_WIDTH, BOX_HEIGHT);
      b[i][j] = new Box((j)*BOX_WIDTH, y, BOX_WIDTH, BOX_HEIGHT);
    }
  }
}

void resetGame() {
  stroke(#9EADBC);
  rect(225, 585, 130, 30, 3);
  int r = int(random(answers.length));
  ans = answers[r];
}

boolean Press() {
  if (mouseX == 250 && mouseY == 250) {
    mousePressed = true;
    return true;
  } else {
    return false;
  }
}

void keyPressed() {
  if (key == BACKSPACE) {
    if (curCol >= 1) {
      curCol--;
    }
    b[curRow][curCol].eraseletter();
  }
  if (key == TAB) {
    darkmode = !darkmode;
    if (darkmode) {
      background(0);
    } else {
      background(255);
    }
  }
  if (key >= 'a' && key <= 'z') {
    if (curCol < cols) {
      if (curRow < rows) {
        b[curRow][curCol].empty= false;
        b[curRow][curCol].l = new Letter (key);
        curCol++;
        println(curCol);
        //wait it should be that it moves on when you rpess enter
        //curRow ++;
        //curCol = 0;
      }
    }
  }
  if (key == ENTER) {
    if (curCol == cols) {
      checkifword();
      if (ifword) {
        checkmatch();
        if (curRow<rows-1) {
          curRow++;
        }
        curCol = 0;
      }
    }
  }
}
void checkifword() {
  println(test);
  for (int i = 0; i<guess.length; i++) {
    if (guess[i].equals(test)) {
      ifword = true;
      i = guess.length -1;
    } else {
      ifword =false;
    }
  }
  println(ans);
}
void checkmatch() {
  for (int j=0; j<cols; j++) {
    b[curRow][j].checked = true;
    for (int i = 0; i < test.length(); i++) {
      if (test.charAt(i) == ans.charAt(i)) {
        b[curRow][i].inpos = true;
      } else if (checkpos(test.charAt(i))) {
        b[curRow][i].inword = true;
      }
    }
  }
}//make sure duplicates fix
boolean checkpos(char t) {
  boolean p = false;
  for (int i = 0; i<ans.length(); i++) {
    if (t == ans.charAt(i)) {
      p = true;
    }
  }
  return p;
}
