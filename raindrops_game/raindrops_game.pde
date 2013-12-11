Catcher c;
Raindrops [] r1 = new Raindrops [500];
int index = 1;
int oldTime = 0;
int score = 0;
PImage background;

void setup() {
  size(500, 500);
  c = new Catcher();
  for (int i = 0; i<r1.length; i++) { //creates raindrops
    r1[i] = new Raindrops();
  }
  background = loadImage("background.jpg"); //creates background
}

void draw() {
  background(background);
  fill(0);
  textAlign(CENTER);
  textSize(50);
  text("Score:\n" +score, 100, 100); //displays scores
  if (millis() - oldTime >=1500) { //controls time for raindrops falling
    oldTime = millis();
    index++;
  }
  c.display();
  for (int i=1; i < index; i++) { //drops raindrops at the controlled time
    r1[i].display();
    r1[i].move();
    r1[i].recognize(c);
  }
}


