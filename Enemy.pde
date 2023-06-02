class Enemy {
  private int x;
  private int y; 
  private int size;
  private int speed;
  private ArrayList<Bullet> battack1;
  private int capacity;
  int capacity= 10;
  private boolean active;


  public Enemy(int x, int y, int size) {
    this.x = x;
    this.y = y;
    this.size = size;
    speed = 1;
    battack1 = new ArrayList<Bullet>();
  }
   int getX() {
    return x;
  }
  int getY() {
    return y;
  }
  boolean getActive() {
    return active;
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
 void attack1() {
    for (Bullet b: battack1) {
      b.drawBullet();
    }
    active = true;
  
}
  void updateattack1() {
    while (battack1.size() > 0) {
      battack1.remove(0);
    }
  }
  
}
