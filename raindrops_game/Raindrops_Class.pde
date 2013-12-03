class Raindrops {
  PVector loc;
  PVector vel;
  PVector acc;
  PImage raindrop;
  int d;
  
  Raindrops(){
    raindrop = loadImage("raindrop.jpg");
    d = 5;
    loc = new PVector(random(width), random(-10,10));
    vel = new PVector(0, random(.5, 3));
    acc = new PVector(0, random(.1,.5));
  }
  
  void display() {
    image(raindrop, d, d, loc.x, loc.y);
  }
  
  void move() {
    loc.add(vel);
    vel.add(acc);
  }
  
  void reset() {
    if (loc.y >= height) {
      loc = new PVector(random(width), 0);
    }
  }
  
  void recognize(Catcher c){
    if (dist(
}
