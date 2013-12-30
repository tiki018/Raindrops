class Raindrops {
  PVector loc;
  PVector vel;
  PVector acc;
  PImage raindrop;
  PImage jungledrop;
  int d;

  Raindrops() {
    d = 40;
    loc = new PVector(random(d, width-d), -40);
    vel = new PVector(0, 2);
    acc = new PVector(0, .1);
    raindrop = loadImage("raindrop.png"); //loads raindrop picture
    jungledrop = loadImage("banana.png");
  }

  void display() {
    if (jungle == false && rain == true) {
      image(raindrop, loc.x, loc.y, d, d); //displays raindrop picture
    }
    if (jungle == true && rain == false) {
      image(jungledrop, loc.x, loc.y, d, d);
    }
  }

  void move() {
    if (loc.y > 0) {
      acc.set(0, gameTime*.000001);
    }
    else {
      acc.set(0, 0);
    }
    loc.add(vel);
    vel.add(acc);
  }

  void recognize(Catcher c) { 
    if (dist(loc.x, loc.y, c.loc.x, c.loc.y) <= d/2 + c.d/2) { //checks for raindrops touching catcher
      loc.set(-500, -500);
      vel.set(0, 0);
      acc.set(0, 0);
      score++; //increases score if raindrop is caught
    }
    if (loc.y > height+100) {
      lives--;
      loc.set(-500, -500);
      vel.set(0, 0);
      acc.set(0, 0);
    }
    if (start == false && stop == true) {
      loc.set(-500, -500);
      vel.set(0, 0);
      acc.set(0, 0);
    }
  }
}

