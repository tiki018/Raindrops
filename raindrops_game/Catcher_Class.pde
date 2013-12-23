class Catcher {
  PVector loc;
  int d;
  PImage catcher;
  
  Catcher() {
    d = 60;
    loc = new PVector(mouseX, height-50);
    catcher = loadImage("monkey.png");
  }
  
  void display() {
    loc.set(mouseX, height-50); //moves the catcher by mouseX
    image(catcher, loc.x, loc.y, d, d);
  }
}
