Catcher c;
Raindrops [] r1 = new Raindrops [500];
int index = 1;
int oldTime = 0;
int newTime = 0;
int score = 0;
int lives = 3;
PImage background;
boolean start = false;
boolean stop = false;

void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  c = new Catcher();
  for (int i = 0; i<r1.length; i++) { //creates raindrops
    r1[i] = new Raindrops();
  }
  background = loadImage("background.jpg"); //creates background
}

void draw() {
  background(background);
  rectMode(CENTER);
  if (start == false && stop == false) {
    fill(120, 100, 100);
    rect(200, 250, 100, 50);
  }
  if (start == true && stop == false) {  
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
    for (int i= 0; i< lives; i++){
      ellipse(400+20*i, 100, 15, 15);
    }
    if(lives == 0){
      start = false;
      stop = true;
    }
  }
  if(start == false && stop == true)
}

void mousePressed(){
  if(mouseX>100 && mouseX < 300 && mouseY>200 && mouseY<300 && start==false){
    oldTime=0;
    start = true;
    stop = false;
  }
}

