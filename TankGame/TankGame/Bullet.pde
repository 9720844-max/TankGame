class Bullet {
  // Member varibles
  float x, y, w, h, speed;
  //PImage spike, soldier;

  // Constructor
  Bullet(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    speed = 10;
  }


  void display() {
 fill(255,0,0);
 rect(x,y,w,h);
  }
  void move() {
  y = y - speed;
  }
}
