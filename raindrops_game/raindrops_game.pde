Catcher c;
Raindrops [] r1 = new Raindrops [500];
int index = 1;
int oldTime = 0;
int newTime = 0;
int score = 0;
int lives = 3;
PImage background;
PImage heart;
PImage jungleback;
PImage rainback;
PImage monkey;
PImage bucket;
boolean start = true;
boolean stop = true;
boolean jungle = false;
boolean rain = false;

void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  imageMode(CENTER);
  textAlign(CENTER);
  c = new Catcher();
  for (int i = 0; i<r1.length; i++) { //creates raindrops
    r1[i] = new Raindrops();
  }
  background = loadImage("jungle.png"); //creates background
  heart = loadImage("heart.png");
  rainback = loadImage("rainback.jpg");
  jungleback = loadImage("jungle.png");
  monkey = loadImage("monkey.png");
  bucket = loadImage("bucket.png");
}

void draw() {
  background(0);
  rectMode(CENTER);
  if (start == true && stop == true && jungle == false && rain == false) {
    image(rainback, 0, 250);
    image(jungleback, 500, 250);
    image(monkey, 375, 400, 75, 75);
    image(bucket, 125, 400, 75, 75);

    fill(360);
    textSize(40);
    text("<- CHOOSE THEME ->", 250, 470);
    fill(360);
    stroke(0);
    strokeWeight(0);
    rect(125, 100, 50, 50);
    if (mouseX>100 && mouseX<150 && mouseY>75 && mouseY<125) {
      fill(0,100,100);
      stroke(0,100,100);
      strokeWeight(8);
      line(100,100,112.5,125);
      line(112.5,125, 150,75);
    }
    text("Rain", 125, 200);
    fill(360);
    stroke(0);
    strokeWeight(1);
    rect(375, 100, 50,50);
    if (mouseX>350 && mouseX<400 && mouseY>75 && mouseY<125) {
      fill(0, 100, 100);
      stroke(0,100,100);
      strokeWeight(8);
      line(350,100,362.5,125);
      line(362.5, 125, 400,75);      
    }
    text("Jungle", 375, 200);
    fill(360);
    stroke(0);
    strokeWeight(1);
  }
  if (start == false && stop == false && rain == true && jungle == false) {
    background(rainback);
  }
  if (start == false && stop == false && rain == false && jungle == true) {
    background(jungleback);
  }
  if (start == false && stop == false) {
    fill(120, 100, 100);
    rect(150, 250, 100, 50);
    rect(350, 250, 100, 50);
    fill(0);
    textSize(13);
    text("Start", 150, 250);
    text("Change Theme", 350, 250);
  }
  if (start == true && stop == false && rain == false && jungle == true) {
    background(jungleback);
  }
  if (start == true && stop == false && rain == true && jungle == false) {
    background(rainback);
  }
  if (start == true && stop == false) {  
    fill(360);
    textAlign(CENTER);
    textSize(40);
    text("Score: " +score, 230, 50); //displays scores
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
    for (int i= 0; i< lives; i++) {
      image(heart, 400+40*i, 75, 35, 35);
    }
    if (lives == 0) {
      start = false;
      stop = true;
      for (int i=1; i< index; i++) {
        r1[i].vel.set(0, 0);
        r1[i].acc.set(0, 0);
        r1[i].loc.set(-500, -500);
      }
    }
  }
  if (start == false && stop == true && jungle == true && rain == false) {
    background(jungleback);
  }
  if (start == false && stop == true && jungle == false && rain == true) {
    background(rainback);
  }
  if (start == false && stop == true) {
    fill(360);
    textSize(50);
    text("GAME OVER!", 250, 150);
    fill(120, 100, 100);
    rect(150, 250, 100, 50);
    rect(350, 250, 100, 50);
    fill(0);
    textSize(13);
    text("Restart", 150, 250);
    text("Change Theme", 350, 250);
  }
}

void mousePressed() {
  if (mouseX>100 && mouseX < 200 && mouseY>225 && mouseY<275 && start==false && stop==false) {
    oldTime=0;
    lives=3;
    score = 0;
    start = true;
    stop = false;
  }
  if (mouseX > 300 && mouseX<400 && mouseY>225 && mouseY<275 && start == false && stop == false && jungle == true && rain == false) {
    background(0);
    start = true;
    stop = true;
    jungle = false;
    rain = false;
  }
  if (mouseX > 300 && mouseX<400 && mouseY>225 && mouseY<275 && start == false && stop == false && jungle == false && rain == true) {
    background(0);
    start = true;
    stop = true;
    jungle = false;
    rain = false;
  }
  if (mouseX>100 && mouseX < 200 && mouseY>225 && mouseY<275 && start==false && stop==true) {
    oldTime=0;
    lives = 3;
    score = 0;
    start = true;
    stop = false;
  }
  if (mouseX>300 && mouseX < 400 && mouseY>225 && mouseY<275 && start == false && stop == true && jungle == true && rain == false) {
    background(0);
    start = true;
    stop = true;
    jungle = false;
    rain = false;
  }
   if (mouseX>300 && mouseX < 400 && mouseY>225 && mouseY<275 && start == false && stop == true && jungle == false && rain == true) {
    background(0);
    start = true;
    stop = true;
    jungle = false;
    rain = false;
  }
  if (mouseX>100 && mouseX<150 && mouseY>75 && mouseY<125 && start == true && stop == true && jungle == false && rain == false) {
    start = false;
    stop = false;
    rain = true;
    jungle = false;
  }
  if (mouseX>350 && mouseX<400 && mouseY>75 && mouseY<125 && start == true && stop == true && jungle == false && rain == false) {
    start = false;
    stop = false;
    rain = false;
    jungle = true;
  }
}

