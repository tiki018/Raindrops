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
    acc = new PVector(0, .01);
    raindrop = loadImage("raindrop.png"); //loads raindrop picture
  }
  
  void display() {
   image(raindrop, loc.x, loc.y, d, d); //displays raindrop picture
  }
  
  void move() {
    loc.add(vel);
    vel.add(acc);
  }
  
  void recognize(Catcher c) { 
    if (dist(loc.x, loc.y, c.loc.x, c.loc.y) <= d/2 + c.d/2) { //checks for raindrops touching catcher
      loc.set(-500, -500);
      vel.set(0,0);
      acc.set(0,0);
      score++; //increases score if raindrop is caught
    }
    if (loc.y > height+100){
      lives--;
      loc.set(-500,-500);
      vel.set(0,0);
      acc.set(0,0);
    }
  }
}
  
  
