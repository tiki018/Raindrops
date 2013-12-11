class Raindrops {
  PVector loc;
  PVector vel;
  PVector acc;
  PImage raindrop;
  int d;
  
  Raindrops() {
    d = 40;
    loc = new PVector(random(d,width-d), -40);
    vel = new PVector(0, 2);
    raindrop = loadImage("raindrop.png"); //loads raindrop picture
  }
  
  void display() {
   image(raindrop, loc.x, loc.y, d, d); //displays raindrop picture
  }
  
  void move() {
    vel.set(0,2+oldTime*.00005); //makes raindrops accelerate as time goes on
    loc.add(vel);
  }
  
  void recognize(Catcher c) { 
    if (dist(loc.x, loc.y, c.loc.x, c.loc.y) <= d/2 + c.d/2) { //checks for raindrops touching catcher
      loc.set(-500, -500);
      vel.set(0,0);
      score++; //increases score if raindrop is caught
    }
  }
}
  
  
