//Hernik Rohrwasser | April 1, 2026 | TankGame
Tank t1;
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();

PImage TB1;
int score;

Timer objTimer, puTimer;

void setup() {
  size(1000, 1000);
  score = 0;

  t1 = new Tank();

  TB1 = loadImage("tankbackground.png");

  objTimer = new Timer(1000);
  objTimer.start();

  puTimer = new Timer(5000);
  puTimer.start();
}

void draw() {
  background(TB1);

  // -------------------------
  // SPAWN OBSTACLES
  // -------------------------
  if (objTimer.isFinished()) {
    for (int i = 0; i < 5; i++) {
      obstacles.add(new Obstacle(
        int(random(-100, 20)),
        int(random(0, height)),
        100, 100,
        5,
        int(random(1, 10))
      ));
    }
    objTimer.start();
  }

  // -------------------------
  // UPDATE OBSTACLES
  // -------------------------
  for (int i = obstacles.size()-1; i >= 0; i--) {
    Obstacle o = obstacles.get(i);
    o.display();
    o.move();

    if (o.reachedEdge()) {
      obstacles.remove(i);
      continue;
    }

    if (t1.intersect(o)) {
      t1.health -= 50;
      obstacles.remove(i);
    }
  }

  // -------------------------
  // UPDATE POWERUPS
  // -------------------------
  if (puTimer.isFinished()) {
    powerups.add(new PowerUp(100, 100));
    puTimer.start();
  }

  for (int i = powerups.size()-1; i >= 0; i--) {
    PowerUp p = powerups.get(i);
    p.display();
    p.move();

    if (p.reachedEdge()) {
      powerups.remove(i);
      continue;
    }

    if (p.intersect(t1)) {
      if (p.type == 't') t1.turretCount++;
      else if (p.type == 'a') t1.laserCount += 100;
      else if (p.type == 'h') t1.health += 100;

      powerups.remove(i);
    }
  }

  // -------------------------
  // BULLETS + COLLISIONS
  // -------------------------
  for (int i = bullets.size()-1; i >= 0; i--) {
    Bullet b = bullets.get(i);

    for (int j = obstacles.size()-1; j >= 0; j--) {
      Obstacle o = obstacles.get(j);

      if (b.intersect(o)) {
        score += 100;
        bullets.remove(i);
        obstacles.remove(j);
        break;
      }
    }

    b.display();
    b.move();

    if (b.reachedEdge()) {
      bullets.remove(i);
    }
  }

  // -------------------------
  // DRAW TANK + UI
  // -------------------------
  t1.display();
  scorePanel();
}

void scorePanel() {
  fill(127, 200);
  rectMode(CENTER);
  rect(width/2, 30, width, 60);

  fill(255);
  textSize(30);
  text("Score: " + score, width/2 - 200, 25);
  text("Health: " + t1.health, width/2, 25);
  text("Ammo: " + t1.laserCount, width/2 + 200, 25);
}

void keyPressed() {
  if (key == 'w') t1.move('w');
  else if (key == 's') t1.move('s');
  else if (key == 'a') t1.move('a');
  else if (key == 'd') t1.move('d');
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
    bullets.add(new Bullet(t1.x, t1.y, dx * speed, dy * speed));
    t1.laserCount--;
  } 
  else if (t1.turretCount == 2 && t1.laserCount > 2) {
    bullets.add(new Bullet(t1.x - 20, t1.y, dx * speed, dy * speed));
    bullets.add(new Bullet(t1.x + 20, t1.y, dx * speed, dy * speed));
    t1.laserCount -= 2;
  }
}
