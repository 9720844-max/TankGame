class Obstacle {
  float x, y, w, h, speed, health;
  PImage sprite;
  char idir;

  Obstacle(float x, float y, float w, float h, float speed, float health) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.speed = speed;
    this.health = health;

    sprite = loadImage("soldier.png");

    float r = random(1);
    if (r < 0.25) idir = 'w';
    else if (r < 0.5) idir = 'd';
    else if (r < 0.75) idir = 'a';
    else idir = 's';
  }

  void display() {
    imageMode(CENTER);
    image(sprite, x, y);
  }

  void move() {
    if (idir == 'w') y -= speed;
    if (idir == 's') y += speed;
    if (idir == 'a') x -= speed;
    if (idir == 'd') x += speed;
  }

  boolean reachedEdge() {
    return (x < -w || x > width + w || y < -h || y > height + h);
  }
}
