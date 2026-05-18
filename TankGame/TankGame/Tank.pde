class Tank {
  float x, y, w, h, speed, health;
  PImage iTankS, iTankD, iTankW, iTankA;
  char idir;
  int turretCount, laserCount;

  Tank() {
    x = 100;
    y = 100;
    w = 100;
    h = 100;
    speed = 3;
    health = 75;

    iTankS = loadImage("tank.png");
    iTankD = loadImage("tank2.png");
    iTankW = loadImage("tank3.png");
    iTankA = loadImage("tank4.png");

    idir = 'w';
    turretCount = 1;
    laserCount = 100;
  }

  void display() {
    imageMode(CENTER);
    if (idir == 'w') image(iTankW, x, y);
    else if (idir == 's') image(iTankS, x, y);
    else if (idir == 'd') image(iTankD, x, y);
    else if (idir == 'a') image(iTankA, x, y);
  }

  void move(char dir) {
    idir = dir;
    if (dir == 'w') y -= speed;
    else if (dir == 's') y += speed;
    else if (dir == 'a') x -= speed;
    else if (dir == 'd') x += speed;
  }

  boolean intersect(Obstacle o) {
    return dist(x, y, o.x, o.y) < (w/2 + o.w/2);
  }
}
