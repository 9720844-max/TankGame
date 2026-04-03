class Tank {
  // Member varibles
  float x, y, w, h, speed, health;
  PImage iTankS, iTankD, iTankW, iTankA;
  char idir;

  // Constructor
  Tank() {
    x = 100.0;
    y = 100.0;
    w = 100.0;
    h = 100.0;
    speed = 2.0;
    health = 75.0;
    iTankS = loadImage("tank.png");
    iTankD = loadImage("tank2.png");
    iTankW = loadImage("tank3.png");
    iTankA = loadImage("tank4.png");
    idir = 'w';
  }

  void display() {
    imageMode(CENTER);
    if (idir == 'w') {
      image(iTankW, x, y);
    } else if (idir == 's') {
      image(iTankS, x, y);
    } else if (idir == 'd') {
      image(iTankD, x, y);
    } else if (idir == 'a') {
      image(iTankA, x, y);
    }
  }

  void move(char dir) {
    if (dir == 'w') {
      idir = 'w';
      y = y - speed;
    } else if (dir == 's') {
      y = y + speed;
    } else if (dir == 'a') {
      x = x - speed;
    } else if (dir == 'd') {
      x = x + speed;
    }
  }

  void fire() {
  }
}
