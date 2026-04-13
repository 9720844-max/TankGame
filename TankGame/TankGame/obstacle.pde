class Obstacle {
  // Member varibles
  float x, y, w, h, speed, health;
  PImage spike;
  char idir;

  // Constructor
  Obstacle(float x, float y, float w, float h, float speed, float health) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.speed = speed;
    this.health = health;
    idir = 'w';
    spike = loadImage("spike.png");
  }


  void display() {
    if (spike != null) {
      image(spike, x, y);
    } else {
      fill(128);
      rect(x, y, w, h);
    }
  }
  void move() {
    x=x+speed;
  }
}
