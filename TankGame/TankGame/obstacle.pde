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
      image(spike, x+20, y+100);
      image(spike, x, y);
     image(spike, x+40, y+300);
    }
  }
  void move() {
    x=x+speed;
       if (x + w > width || x < 0) {
      speed = speed * -1; 
    }
  }
}
