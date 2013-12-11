class Catcher {
  PVector loc;
  int d;
  
  Catcher() {
    d = 25;
    loc = new PVector(mouseX, height-50);
  }
  
  void display() {
    loc.set(mouseX, height-50); //moves the catcher by mouseX
    ellipse(loc.x, loc.y, d,d);
  }
}
