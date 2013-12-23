class Catcher {
  PVector loc;
  int d;
  PImage raincatcher;
  PImage junglecatcher;

  Catcher() {
    d = 75;
    loc = new PVector(mouseX, height-50);
    junglecatcher = loadImage("monkey.png");
    raincatcher = loadImage("bucket.png");
  }

  void display() {
    loc.set(mouseX, height-50); //moves the catcher by mouseX
    if (jungle == true && rain == false) {
      image(junglecatcher, loc.x, loc.y, d, d);
    }
    if(jungle == false && rain == true) {
      image(raincatcher, loc.x, loc.y, d, d);
    }
  }
}

