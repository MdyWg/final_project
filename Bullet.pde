class Bullet {
int size = 20; //default size
  //PVector dir = new PVector(0, 0);
  //PVector pos ;
  //PVector pos2 ;
  //PVector pos3;
  int posx;
  int posy;
  int bulletx;
  int bullety;
  boolean bfired;
  void setup() {
    size(600, 900);
    //pos = new PVector( (width/2) - (size/2), height- (size));
    //pos2 = new PVector( (width/2) + (size / 2), height - (size));
    //pos3 = new PVector( width/2, height - (2 * size));
    posx = (width/2) - (size/2);
    posy = (height - (2 * size));
    bulletx = posx;
    bullety = posy - size;
  }
  void draw() {
    background(0);
    newPlayer();
    newBullet();
    bfired = true;
    //println(bullety);
    if (bullety <= 5) {
      bullety = posy - size;
    }
    //triangle(pos.x, pos.y, pos2.x, pos2.y, pos3.x, pos3.y);
    //pos.x += size * dir.x;
    //pos.y += size * dir.y;
    //pos2.x += size * dir.x;
    //pos2.y += size * dir.y;
    //pos3.x += size * dir.x;
    //pos3.y += size *t dir.y;
    
  }
  
  void newPlayer() {
    fill(255);
    square(posx, posy, size );
    //triangle(pos.x, pos.y, pos2.x, pos2.y, pos3.x, pos3.y);
  }
  
  void newBullet() {
    fill(123);
    //bulletx = posx;
    //bullety = posy;
    if (!bfired) {
      bulletx = posx;
      bullety = posy;
      bfired = true;
    } else {
      bulletx = posx;
      bullety -= size;
      if (bullety <= 5) {
        bfired = false;
    }
    }
    rect(bulletx, bullety, size/4, size);
  }
  //void shoot() {
  //  while(bullety > 0) {
  //  bulletx = posx;
  //  bullety -= size;
  //  }
  //}
  void keyPressed() {
  if (keyCode == UP) {
   //dir = new PVector(0, -1);
   posy -= 5;
 } else if (keyCode == DOWN) {
   //dir = new PVector(0, 1);
   posy += 5;
 } else if (keyCode == LEFT) {
   //dir = new PVector(-1, 0);
   posx -= 5;
 } else if (keyCode == RIGHT) {
   //dir = new PVector(1, 0);
   posx += 5;
 }
 //} else if (key == 'j') {
 //  bfired = true;
 //  shoot();
 //}
}
}
