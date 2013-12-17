Catcher c;
Raindrops [] r1 = new Raindrops [500];
int index = 1;
int oldTime = 0;
int newTime = 0;
int score = 0;
int lives = 3;
PImage background;
PImage heart;
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
  heart = loadImage("heart.png");
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
      image(heart,400+30*i, 75,25,25);
    }
    if(lives == 0){
      start = false;
      stop = true;
      for(int i=1; i< index; i++){
        r1[i].vel.set(0,0);
        r1[i].acc.set(0,0);
        r1[i].loc.set(-500,-500);
      }
    }
  }
  if(start == false && stop == true){
    fill(0);
    textSize(50);
    text("GAME OVER!", 250,150);
    fill(120,100,100);
    rect(200, 250, 100, 50);
    fill(0);
    textSize(15);
    text("Restart", 200,250);
  }
}

void mousePressed(){
  if(mouseX>100 && mouseX < 300 && mouseY>200 && mouseY<300 && start==false && stop==false){
    oldTime=0;
    start = true;
    stop = false;
  }
  if(mouseX>100 && mouseX < 300 && mouseY>200 && mouseY<300 && start==false && stop==true){
    oldTime=0;
    lives = 3;
    score = 0;
    start = true;
    stop = false;
  }
}

