void bunny (int lx, int ly, int lSize) {
  fill (211,211,211);
  lSize = 100;
  square (lx/4, ly/4, lSize);
  fill (192,192,192);
  rect (100,40, 40, 60);
  rect (160,40,40,60);
  fill (0,0,0);
  ellipse (150, 180, 30, 10);
  circle (133, 133, 10);
  circle (167, 133, 10);
  fill (219, 112, 147);
  triangle (145, 155, 155, 155, 150, 165);
  line (133, 160, 90, 145);
  line (133, 167, 90, 182);
  line (167, 160, 210, 145);
  line (167, 167, 210, 182);
}
void setup () {
size (400,400);
background (107,143,35);
 bunny;
}
