class Obstacle {
  // Member varibles
  float x, y, w, h, speed, health;
  PImage spike, soldier;
  char idir;

  // Constructor
  Obstacle(float x, float y, float w, float h, float speed, float health) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.speed = speed;
    this.health = health;
    if (int(random(4))==2) {
    idir = 'w';
    x = random(width);
    y = height + 100;
    } else if (int(random(3))==1) {
    idir = 'd';
    x = -100;
    y = random(height);
    } else if (int(random(2))==1) {
    idir = 'a';
    x = width+100;
    y = random(height);
    } else if (int(random(1))==1) {
    idir = 'w';
    x = random(width);
    y = height + 100;
    }
    
    
    idir = 'w';
    spike = loadImage("spike.png");
    soldier = loadImage("soldier.png");
  }
  

  void display() {
    imageMode(CENTER);
    image(soldier, x, y+200);
  }
  void move() {
    x=x+2;
    if (x>width+w/2) {
      x=0;
    }
  }
  boolean reachedEdge() {

    if (x<0-w/2 || x>width +w/2 || y < 0-w/2|| y> height+w/2) {
      return true;
    } else {
      return false;
    }
  }
}
