class Enemy {
  private int x;
  private int y; 
  private int size;
  private int speed;
  ArrayList<EnemyBullet> battack1;
  ArrayList<EnemyBullet> battack1move;
 // int bulletcapacity= 10;
  boolean active = false;
 // private int offcount = 0;


  public Enemy(int x, int y, int size) {
    this.x = x;
    this.y = y;
    this.size = size;
    speed = 1;
    battack1 = new ArrayList<EnemyBullet>();
    battack1move = new ArrayList<EnemyBullet>();
    //battack1dead = new ArrayList<EnemyBullet>();
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
  
 
  void displayload() {
    for (EnemyBullet b: battack1) {
      b.drawBullet();
    }
  
}
  void displayattack1() {
    for (EnemyBullet b: battack1move) {
      b.drawBullet();
    }
  }
  void updateattack1() {

    for (int i = 0; i < battack1move.size(); i++) {
      if (battack1move.get(i).bulletOffScreen()) {
        battack1move.remove(i);
      } 
    }
    for (int i = 0; i < battack1move.size(); i++) {
        battack1move.get(i).updateBullet1();
    }


  }

  

  }

  
