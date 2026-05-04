class Bullet {
  float x, y, w, h;
  float vx, vy;

  Bullet(float x, float y, float vx, float vy) {
    this.x = x;
    this.y = y;
    this.w = 10;
    this.h = 10;
    this.vx = vx;
    this.vy = vy;
  }

  void display() {
    fill(255, 0, 0);
    rectMode(CENTER);
    rect(x, y, w, h);
  }

  void move() {
    x += vx;
    y += vy;
  }

  boolean intersect(Obstacle o) {
    return dist(x, y, o.x, o.y) < (o.w/2 + w/2);
  }

  boolean reachedEdge() {
    return (x < -w || x > width + w || y < -h || y > height + h);
  }
}
