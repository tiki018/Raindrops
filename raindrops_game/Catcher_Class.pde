class Catcher {
  PVector loc;
  int d;
  
  Catcher() {
    d = 10;
    loc = new PVector(mouseX, height-20);
  }
  
  void display() {
    ellipse(loc.x, loc.y, d, d);
  }
}
