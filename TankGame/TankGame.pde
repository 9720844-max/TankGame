//Hernik Rohrwasser | April 1, 2026 | TankGame
Tank t1;
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
Obstacle o1;
PImage TB1;
int score;
Timer objTimer, puTimer;

void setup() {
  size(1000, 1000);
  score = 0;
  t1 = new Tank();
  objTimer = new Timer(1000);
  objTimer.start();
  puTimer = new Timer(5000);
  puTimer.start();
  //obstacles.add(new Obstacle(300, 200, 100, 100, int(random(1, 10)), 100));
}

void draw() {
  TB1 = loadImage("tankbackground.png");
  background(TB1);


  if (objTimer.isFinished()) {
    obstacles.add(new Obstacle(int(random(-100, 20)), int(random(0, height)), 100, 100, 5, int(random(1, 10))));
    obstacles.add(new Obstacle(int(random(-100, 20)), int(random(0, height)), 100, 100, 5, int(random(1, 10))));
    obstacles.add(new Obstacle(int(random(-100, 20)), int(random(0, height)), 100, 100, 5, int(random(1, 10))));
    obstacles.add(new Obstacle(int(random(-100, 20)), int(random(0, height)), 100, 100, 5, int(random(1, 10))));
    obstacles.add(new Obstacle(int(random(-100, 20)), int(random(0, height)), 100, 100, 10, int(random(1, 10))));
    objTimer.start();
  }
  if (objTimer.isFinished()) {
    // obstacles.add(new PowerUp((()));
    objTimer.start();
  }
  for (int i = 0; i < obstacles.size(); i++) {
    Obstacle o = obstacles.get(i);
    o.display();
    o.move();
    if (o.reachedEdge()) {
      obstacles.remove(i);
    }
  }
  for (int i = 0; i < powerups.size(); i++) {
    PowerUp p = powerups.get(i);
    p.display();
    p.move();
    if (p.reachedEdge()) {
      powerups.remove(i);
    }
    if (p.intersect(t1)) {
      //Turret
      if (p.type =='t') {
        t1.turretCount = t1.turretCount + 1;
      } else if (p.type =='a') {
        t1.laserCount = t1.laserCount + 100;
      } else if (p.type =='h') {
        t1.health = t1.health + 100;
      }
    }

   if (t1.intersect(p)) { 
   t1.health = t1.health-50; obstacles.remove(i);
 }
    //health of tank
  }
  // Render and detect collisions=
  for (int i = 0; i < bullets.size(); i++) {
    Bullet p = bullets.get(i);
    for (int j = 0; j < obstacles.size(); j++) {
      Obstacle o = obstacles.get(j);
      if (p.intersect(o)) {
        score = score + 100;
        bullets.remove(i);
        obstacles.remove(j);
        continue;
      }
    }
    p.display();
    p.move();
    if (p.reachedEdge()) {
      bullets.remove(i);
    }
  }

  t1.display();

  scorePanel();
  println("Projectiles in Memory");

  if (puTimer.isFinished()) {
    powerups.add(new PowerUp(100, 100));
    puTimer.start();
  }
  for (int i = 0; i < powerups.size(); i++) {
    PowerUp pu = powerups.get(i);
    pu.display();
    pu.move();
    if (pu.reachedEdge()) {
      powerups.remove(i);
    }

    //if (t1.intersect(pu)) {

    //}
  }
}

void scorePanel() {
  fill(127, 200);
  rectMode(CENTER);
  rect(width/2, 30, width, 60);
  fill(255);
  textSize(30);
  text("Score: " +score, CENTER, 25);
  if (score < -300) {
    noLoop();
    text("Health:" +t1.health, width/2-150, 25);
    text("Health:" +t1.laserCount, width/2+150, 25);
  }
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
  if (t1.turretCount == 1 && t1.laserCount > 0) {
    bullets.add(new Bullet(t1.x, t1.y, dx *speed, dy * speed));
    t1.laserCount = t1.laserCount - 1;
  } else  if (t1.turretCount == 2 && t1.laserCount > 2) {
    bullets.add(new Bullet(t1.x-20, t1.y, dx *speed, dy * speed));
    bullets.add(new Bullet(t1.x+20, t1.y, dx *speed, dy * speed));
    t1.laserCount = t1.laserCount - 2;
  }
}
