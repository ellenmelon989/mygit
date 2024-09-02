void setup () {
  size (400,400);
  background (107,143,35);
  bunny (100,100,100);
  bunny (300,300,100);
  bunny (100,300,100);
  bunny (300,100,100);
}
void bunny (int lx, int ly, int lSize) {
  fill (211,211,211);
  square (lx, ly, lSize/2);
  fill (192,192,192);
  rect (lx,ly - 30, lSize/5, lSize *.3);
  rect (lx + 30, ly - 30, lSize/5, lSize *.3);
  fill (0,0,0);
  ellipse (lx+25, ly+40, lSize/5, lSize/10);
  circle (lx+15, ly+15, lSize/20);
  circle (lx+35, ly+15, lSize/20);
  fill (219, 112, 147);
  triangle (lx+20, ly+25, lx+30, ly+25, lx+25, ly+30);
  line (lx+15, ly+25, lx-10, ly+20);
  line (lx+15, ly+30, lx-10, ly+35);
  line (lx+35, ly+25, lx+60, ly+20);
  line (lx+35, ly+30, lx+60, ly+35);
}
