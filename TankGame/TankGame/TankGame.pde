//Hernik Rohrwasser | April 1, 2026 | TankGame
Tank t1;
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
Obstacle o1;
PImage TB1;
int score;

void setup() {
  size(1000, 1000);
  score = 0;
  t1 = new Tank();
  obstacles.add(new Obstacle(300, 200, 100, 100, int(random(1, 10)), 100));
}

void draw() {
  TB1 = loadImage("tankbackground.png");
  background(TB1);
  for (int i = 0; i < bullets.size(); i++) {
    Bullet p = bullets.get(i);
    p.display();
    p.move();
  }
  for (int i = 0; i < obstacles.size(); i++) {
    Obstacle o = obstacles.get(i);
    o.display();
    o.move();
  }

  t1.display();

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
  float dx = mouseX - t1.x;
  float dy = mouseY - t1.y;
  float mag = sqrt(dx*dx + dy*dy);

  if (mag > 0) {
    dx /= mag;
    dy /= mag;
  }
  float speed = 5;
  bullets.add(new Bullet(t1.x, t1.y, dx * speed, dy * speed));
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
