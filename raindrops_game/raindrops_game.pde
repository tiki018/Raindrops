Catcher c;
Raindrops [] r1 = new Raindrops [1000];
int index = 1;
int oldTime = 0;
int fTime = 0;
int newTime = 0;
int startTime = 0;
int gameTime = 0;
int score = 0;
int lives = 3;
float frequency = 1;
PImage heart;
PImage jungleback;
PImage rainback;
PImage monkey;
PImage bucket;
boolean start = true;
boolean stop = true;
boolean jungle = false;
boolean rain = false;
String raindirections;
String jungledirections;

void setup() {
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
  imageMode(CENTER);
  textAlign(CENTER);
  rectMode(CENTER);
  c = new Catcher(); //creates catcher
  for (int i = 0; i<r1.length; i++) { //creates raindrops
    r1[i] = new Raindrops();
  }
  images();
  raindirections = "Directions:\n Move your mouse to move the bucket from\n side to side to catch the raindrops that are falling.\nThe more you catch, the higher your score.";
  jungledirections = "Directions:\n Move your mouse to move the monkey from\n side to side to catch the bananas that are falling.\nThe more you catch, the higher your score.";
}

void draw() {
  background(0);
  thememenu();
  startmenu();
  playgame();
  gameover();
}

void mousePressed() {
  if (mouseX>100 && mouseX < 200 && mouseY>225 && mouseY<275 && start==false && stop==false) { //start button on start menu
    reset();
  }
  if (mouseX > 300 && mouseX<400 && mouseY>225 && mouseY<275 && start == false && stop == false && jungle == true && rain == false) { //change theme button on start menu
    background(0);
    start = true;
    stop = true;
    jungle = false;
    rain = false;
  }
  if (mouseX > 300 && mouseX<400 && mouseY>225 && mouseY<275 && start == false && stop == false && jungle == false && rain == true) { //change theme button on start menu
    background(0);
    start = true;
    stop = true;
    jungle = false;
    rain = false;
  }
  if (mouseX>100 && mouseX < 200 && mouseY>225 && mouseY<275 && start==false && stop==true) { //restart button on game over
    reset();
  }
  if (mouseX>300 && mouseX < 400 && mouseY>225 && mouseY<275 && start == false && stop == true && jungle == true && rain == false) { //change theme button on game over
    background(0);
    start = true;
    stop = true;
    jungle = false;
    rain = false;
  }
  if (mouseX>300 && mouseX < 400 && mouseY>225 && mouseY<275 && start == false && stop == true && jungle == false && rain == true) { //change theme button on game over
    background(0);
    start = true;
    stop = true;
    jungle = false;
    rain = false;
  }
  if (mouseX>100 && mouseX<150 && mouseY>75 && mouseY<125 && start == true && stop == true && jungle == false && rain == false) { //rain gamemode button on theme menu
    start = false;
    stop = false;
    rain = true;
    jungle = false;
  }
  if (mouseX>350 && mouseX<400 && mouseY>75 && mouseY<125 && start == true && stop == true && jungle == false && rain == false) { //jungle gamemode button on theme menu
    start = false;
    stop = false;
    rain = false;
    jungle = true;
  }
}

void reset() { //resets all values used in game and changes the gamemode to start the game
  oldTime=0;
  lives=3;
  score = 0;
  frequency = 1;
  startTime=millis();
  start = true;
  stop = false;
}

void images() { //loads all images used in game
  heart = loadImage("heart.png");
  rainback = loadImage("rainback.jpg");
  jungleback = loadImage("jungle.png");
  monkey = loadImage("monkey.png");
  bucket = loadImage("bucket.png");
}

void checkbackground() { //checks which game mode is currently on, jungle or rain, and then chooses the resulting background
  if (jungle == true && rain == false) {
    background(jungleback);
  }
  if (rain == true && jungle == false) {
    background(rainback);
  }
}

void timecheck() { //checks time so acceleration can change over the period of the game, the frequency of the raindrops can be faster, and more raindrops fall.
  if (millis() - fTime >= 1000) {
    fTime = millis();
    frequency = frequency - .02;
  }
  if (millis() - oldTime >= 1500*frequency) {
    oldTime = millis();
    index++;
  }
  gameTime = oldTime - startTime;
}

void thememenu() { //lets you choose either jungle theme or rain theme by clicking the corresponding box
  if (start == true && stop == true && jungle == false && rain == false) {
    image(rainback, 0, 250);
    image(jungleback, 500, 250);
    image(monkey, 375, 375, 75, 75);
    image(bucket, 125, 375, 75, 75);
    fill(360);
    textSize(30);
    text("SELECT BOX TO\n<- CHOOSE THEME ->", 250, 440);
    fill(360);
    stroke(0);
    strokeWeight(8);
    rect(125, 100, 50, 50);
    if (mouseX>100 && mouseX<150 && mouseY>75 && mouseY<125) { //if the mouse hovers over the rain theme the box has a check mark and the rain text changes color
      fill(0, 100, 100);
      stroke(0, 100, 100);
      strokeWeight(8);
      line(100, 100, 112.5, 125);
      line(112.5, 125, 150, 75);
    }
    text("Rain", 125, 200);
    fill(360);
    stroke(0);
    strokeWeight(8);
    rect(375, 100, 50, 50);
    if (mouseX>350 && mouseX<400 && mouseY>75 && mouseY<125) { //if the mouse hovers over the jungle theme the box has a check mark and jungle text changes color
      fill(0, 100, 100);
      stroke(0, 100, 100);
      strokeWeight(8);
      line(350, 100, 362.5, 125);
      line(362.5, 125, 400, 75);
    }
    text("Jungle", 375, 200);
    fill(360);
    stroke(0);
    strokeWeight(1);
  }
}

void startmenu() { //start menu, lets you start game or change the theme
  if (start == false && stop == false) {
    checkbackground();
    fill(120, 100, 100);
    rect(150, 250, 100, 50);
    rect(350, 250, 100, 50);
    fill(0);
    textSize(13);
    text("Start", 150, 250);
    text("Change Theme", 350, 250);
    textSize(15);
    fill(360);
    rect(250, 80, 375, 100);
    fill(0);
    if (rain == true && jungle == false){
      text(raindirections, 250, 50);
    }
    if (jungle == true && rain == false){
      text(jungledirections, 250, 50);
    }
  }
}


void playgame() { //lets you play game
  if (start == true && stop == false) {  
    checkbackground();
    fill(360);
    textAlign(CENTER);
    textSize(40);
    text("Score: " +score, 230, 50); //displays scores
    timecheck();
    c.display();
    for (int i=1; i < index; i++) { //drops raindrops at the controlled time
      r1[i].display();
      r1[i].move();
      r1[i].recognize(c);
    }
    for (int i= 0; i< lives; i++) { // displays heart (lives)
      image(heart, 400+40*i, 75, 35, 35);
    }
    if (lives == 0) { //if no lives left it changes to game over screen and clears all raindrops on screen
      start = false;
      stop = true;
      for (int i=1; i< index; i++) {
        r1[i].vel.set(0, 0);
        r1[i].acc.set(0, 0);
        r1[i].loc.set(-500, -500);
      }
    }
  }
}

void gameover() { //game over screen displays score from last run, restart button and change theme button
  if (start == false && stop == true) {
    checkbackground();
    fill(360);
    textSize(50);
    text("GAME OVER!", 250, 150);
    text("Score:" +score, 250, 400);
    fill(120, 100, 100);
    rect(150, 250, 100, 50);
    rect(350, 250, 100, 50);
    fill(0);
    textSize(13);
    text("Restart", 150, 250);
    text("Change Theme", 350, 250);
  }
}
