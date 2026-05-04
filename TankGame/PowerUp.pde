class PowerUp {
  float x, y, w, h, speed;
  char type;

  PowerUp(float x, float y) {
    this.x = x;
    this.y = y;
    w = 60;
    h = 60;
    speed = 3;

    float r = random(1);
    if (r < 0.33) type = 'h';     // health
    else if (r < 0.66) type = 't'; // turret
    else type = 'a';              // ammo
  }

  void display() {
    fill(255);
    textAlign(CENTER);

    if (type == 'h') {
      fill(0, 200, 0);
      ellipse(x, y, w, h);
      fill(255);
      text("Health", x, y);
    } 
    else if (type == 't') {
      fill(0, 0, 200);
      ellipse(x, y, w, h);
      fill(255);
      text("Turret", x, y);
    } 
    else if (type == 'a') {
      fill(200, 0, 0);
      ellipse(x, y, w, h);
      fill(255);
      text("Ammo", x, y);
    }
  }

  void move() {
    y += speed;
  }

  boolean reachedEdge() {
    return (y > height + h);
  }

  boolean intersect(Tank t) {
    return dist(x, y, t.x, t.y) < (w/2 + t.w/2);
  }
}
