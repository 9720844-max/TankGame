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
   image(soldier,x,y+700);
   image(soldier,x+200,y+400);
   image(soldier,x+40,y+900);
   image(spike,500,500);
   image(spike,123,850);
   image(spike,672,104);
   image(spike,915,433);
   image(spike,305,617);
   image(spike,88,971);
   
   
  }
  void move() {
    x=x+3;
       if(x > width) {
      x=0; 
    }
  }
}
