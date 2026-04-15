//Hernik Rohrwasser | April 1, 2026 | TankGame
Tank t1;
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
Obstacle o1;
PImage TB1;
int score;

void setup() {
  size(1000, 1000);
  score = 0;
  t1 = new Tank();
  o1 = new Obstacle(400, 100, 100, 50, 5, 100);
}

void draw() {
  TB1 = loadImage("tankbackground.png");
  background(TB1);
  for (int i = 0; i < bullets.size(); i++) {
    Bullet p = bullets.get(i);
    p.display();
    p.move();
  }
  t1.display();
  o1.display();
  o1.move();
  scorePanel();
}

void keyPressed() {
  if (key == 'w') {
    t1.move('w');
  } else if (key == 's') {
    t1.move('s');
  } else if (key == 'a') {
    t1.move('a');
  } else if (key == 'd') {
    t1.move('d');
  }
}

void mousePressed() {
  bullets.add(new Bullet(t1.x, t1.y, 4, 10));
}

void scorePanel() {
  fill(127, 200);
  rectMode(CENTER);
  noStroke();
  rect(width/2, 15, width, 30);
  fill(255);
  textSize(25);
  textAlign(CENTER);
  text("Score:" + score, width/2, 25);
}
