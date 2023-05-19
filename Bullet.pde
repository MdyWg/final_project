 int size = 20; //default size
  PVector dir = new PVector(0, 0);
  PVector pos ;
  PVector pos2 ;
  PVector pos3;
  void setup() {
    size(1000, 500);
    pos = new PVector(size, (height/2) - (size/2));
    pos2 = new PVector(size, (height/2) + (size / 2));
    pos3 = new PVector( 2 * size, height/2);

  }
  void draw() {
    newPlayer();
    //triangle(pos.x, pos.y, pos2.x, pos2.y, pos3.x, pos3.y);
    pos.x += size * dir.x;
    pos.y += size * dir.y;
    pos2.x += size * dir.x;
    pos2.y += size * dir.y;
    pos3.x += size * dir.x;
    pos3.y += size * dir.y;
  }
  
  void newPlayer() {
    fill(0);
    triangle(pos.x, pos.y, pos2.x, pos2.y, pos3.x, pos3.y);
  }
  void keyPressed() {
  if (keyCode == UP) {
   dir = new PVector(0, -1);
 } else if (keyCode == DOWN) {
   dir = new PVector(0, 1);
 } else if (keyCode == LEFT) {
   dir = new PVector(-1, 0);
 } else if (keyCode == RIGHT) {
   dir = new PVector(1, 0);
 }
}
