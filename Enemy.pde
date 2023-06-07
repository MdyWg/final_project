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
      //translate(5, 5);
    }
  
}
  void displayattack1() {
    for (EnemyBullet b: battack1move) {
      b.drawBullet();
    }
  }
  void updateattack1() {
  //   active = true;
    //for (int i = 0; i < battack1move.size(); i++) {
    //  if (i % 4 == 0) {
    //      battack1move.get(i).diry = 0;
    //      battack1move.get(i).dirx = 1;
    //  } else if (i % 4 == 1) {
    //    battack1move.get(i).diry = 0;
    //    battack1move.get(i).dirx = -1;
    //  } else if (i % 4 == 2) {
    //    battack1move.get(i).dirx = 1;
    //    battack1move.get(i).diry = 1;
    //  } else {
    //    battack1move.get(i).dirx = -1;
    //    battack1move.get(i).diry = 1;
    //  }
    //}

    for (int i = 0; i < battack1move.size(); i++) {
      if (bulletOffScreen(battack1move.get(i))) {
        battack1move.remove(i);
        println(battack1move.size());
      } 
    }
    for (int i = 0; i < battack1move.size(); i++) {
      battack1move.get(i).updateBullet1();
    }

    
     //for (EnemyBullet b: battack1) {
       
     //   b.pos.x += 5 * b.dirx;
     //   b.pos.y += 5 * b.diry;
     //}
  }
  boolean bulletOffScreen(EnemyBullet b) {
    if (b.pos.x < 0 || b.pos.x > 900 || b.pos.y < 0 || b.pos.y > 900) {
      return true;
    }
  return false;
  }
  

  }

  
