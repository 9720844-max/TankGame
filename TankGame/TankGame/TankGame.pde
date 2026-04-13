//Hernik Rohrwasser | April 1, 2026 | TankGame
Tank t1;
Obstacle o1;
PImage TB1;

void setup() {
  size(1000, 1000);
  t1 = new Tank();
  o1 = new Obstacle(400,100,100,50,5,100);
}

void draw() {
  TB1 = loadImage("tankbackground.png");
  background(TB1);
  t1.display();
  o1.display();
  o1.move();
}

void keyPressed() {
  if (key == 'w') {
    t1.move('w');
  } else if(key == 's') {
  t1.move('s');
  } else if(key == 'a') {
  t1.move('a');
  } else if(key == 'd') {
  t1.move('d');
  }
}
