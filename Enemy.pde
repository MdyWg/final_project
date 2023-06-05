class Enemy {
  private int x;
  private int y; 
  private int size;
  private int speed;
  private ArrayList<EnemyBullet> battack1;


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
  
}
  void updateattack1() {
   for (EnemyBullet b: battack1) {
       
        b.pos.x += 5 * b.dirx;
        b.pos.y += 5 * b.diry;
     }
 //boolean allOff() {
 //   for (EnemyBullet b: battack1) {
 //     if (b.pos.x < 0 || b.pos.x > 900 || b.pos.y < 0 || b.pos.y > 900) {
 //       offcount++;
 //     }
 //   }
 //   if (offcount == 4){
 //     return true;
 //   }
 //   return false;
 // }

     //while (battack1.size() > 0) {
     //  battack1.remove(0);
     //}
  
}
