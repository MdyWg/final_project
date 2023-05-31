class Enemy {
  private int x;
  private int y; 
  private int size;
  private int speed;


  public Enemy(int x, int y, int size) {
    this.x = x;
    this.y = y;
    this.size = size;
    speed = 1;
  }
   int getX() {
    return x;
  }
  int getY() {
    return y;
  }
  void drawEnemy() {
    fill(252, 0, 30);
    square(x, y, size);
  }
  
  void updateEnemy() {
    y += speed;
  }
  
  boolean spawned() {
    if (count == spawnTime) {
      count = 0;
      return true;
    } else {
      count++;
      return false;
    }
  }
  
}
