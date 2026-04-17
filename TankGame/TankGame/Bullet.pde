class Bullet {
  // Member varibles
  float x, y, w, h, speed;
  float vx, vy;
  //PImage spike, soldier;

  // Constructor
  Bullet(float x, float y, float vx, float vy) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.vx = vx;
    this.vy = vy;
    speed = 10;
  }


  void display() {
 fill(255,0,0);
 rect(x,y,w,h);
  }
  void move() {
  //y = y - speed;
  x += vx;
  y += vy;
  }
}
