 private int x; 
  private int y;
  private int size;
  private int speed = 2;
  private int dir = 1;
  private int life = 100;
  ArrayList<BossBullet> attack1;
  ArrayList<BossBullet> attack21;
  ArrayList<BossBullet> attack22;
  int switchcount = 0;
  boolean attack1done = false;
  int attacknumber = 0;
  boolean immune = true;
  public Boss(int x, int y) {
    this.x = x;
    this.y = y;
    size = 100;
    img = loadImage("collegeboard.jpg");
    img2 = loadImage("collegeboard2.jpg");
    attack1 = new ArrayList<BossBullet>();
    attack21 = new ArrayList<BossBullet>();
    attack22 = new ArrayList<BossBullet>();
  }
  int getSize() {
    return size;
  }
  int getX() {
    return x;
  }
  int getY() {
    return y;
  }
  void displayBoss() {
    if (life <= 0) {
      image(img2, x, y, size, size);
    }
    else {
    image(img, x, y, size, size);
    }
  }
  void moveBoss() {
    if (y < 100) {
    y+= speed;
    }
     else {
      if (switchcount % 4 == 0 && switchcount > 0) {
        if (x < width/ 2) {
            x+= 3/2 * speed * dir ;
        } else {
          attack1done = true;
          x+= 0;
        }
      } else {
      x += 3/2 * speed * dir;
      if (x + size + size/2 >= 800) {
        dir = -1;
        switchcount++;
      }
      if (x <= 100) {
        dir = 1;
        switchcount++;
      }
      }
  }
}

void updateattackSequence() {
  if (attacknumber == 1) {
    updateattack1();
  } else {
    updateattack21();
    updateattack22();
  }
}
  void attack1() {
      attacknumber = 1;
      attack1.add(new BossBullet(x + size /2, y + size, size/10, random(-1, 1), 1, 0));

  }
  void displayattack1() {
  for (BossBullet b: attack1) {
    b.bulletType = 1;
    b.drawBullet();
  }
  }
  void updateattack1() {
    for (BossBullet b: attack1) {
        b.updateBullet();
    }
  }
  
  void displayattack21() {
    for (BossBullet b: attack21) {
      b.bulletType = 2;
      b.drawBullet();
    }
  }
  void displayattack22() {
    for (BossBullet b: attack22) {
      b.bulletType = 2;
      b.drawBullet();
    }
  }
  
  void updateattack21() {
    for (BossBullet b: attack21) {
      b.updateBullet();
    }
  }
  
    void updateattack22() {
    for (BossBullet b: attack22) {
      b.updateBullet();
    }
  }


  
}
