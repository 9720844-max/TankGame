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
    idir = 'w';
    spike = loadImage("spike.png");
    soldier = loadImage("soldier.png");
  }


  void display() {
   imageMode(CENTER);
   image(soldier,x,y+200);
   
   
  }
  void move() {
    x=x+3;
       if(x > width) {
      x=0; 
    }
  }
}
