int newTime=0;
int oldTime=0;
int changeTime=0;
Catcher c;
Raindrops[] r1 = new Raindrops [10000];

void setup() {
  size(500, 500);
  c = new Catcher();
  for (int i = 0; i < 10000; i++) {
    r1[i] = new Raindrops();
  }
}

void draw() {
  background(0);
  c.display();
  newTime = millis();
  changeTime = newTime-oldTime;
  if (changeTime == 1000) {
    oldTime=newTime;
  }
  for (int i = 0; i < 10000; i++) {
    if (changeTime == 1000) {
      r1[i].display();
      r1[i].move();
      r1[i].recognize(c);
    }
  }
}

