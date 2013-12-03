color c;
color j;
void setup(){
  size(500,500);
  colorMode(HSB, 360, 100, 100);
  c = color(random(360),random(75,100),random(75,100));
  j = color(random(360), random(75,100), random(75,100));
}

void draw(){
  background(c);
  fill(j);
  if (frameCount%5 == 0){
    c = color(random(360), random(75,100), random(75,100));
    j = color(random(360), random(75,100), random(75,100));
  }
  textSize(20);
  textAlign(CENTER);
  text(frameCount, width/2, height/2);
}
