class Catcher {
  PVector loc;
  color c;
  int d;
  
  Catcher() {
    c = color(random(360),100,100);
    d = 10;
    loc = new PVector(mouseX, height-20);
  }
  
  void display() {
    fill(c);
    ellipse(loc.x, loc.y, d, d);
  }
