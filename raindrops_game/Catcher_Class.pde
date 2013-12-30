class Catcher {
  PVector loc;
  int d;

  Catcher() {
    d = 75;
    loc = new PVector(mouseX, height-50);
  }

  void display() {
    loc.set(mouseX, height-50); //moves the catcher by mouseX
    if (jungle == true && rain == false) {
      image(monkey, loc.x, loc.y, d, d);
    }
    if (jungle == false && rain == true) {
      image(bucket, loc.x, loc.y, d, d);
    }
  }
}

