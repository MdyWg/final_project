class Bullet {
  private int bulletx;
  private int bullety;
  private boolean bfired;
  ArrayList<Bullet> bullets = new ArrayList<Bullet>();
  public Bullet(int x, int y, int size) {
    bulletx = x;
    bullety = y;
    this.size = size;
  }
  int getbx(){
    return bulletx;
  }
  int getby() {
    return bullety;
  }
  void drawBullets() {
    for (Bullet b: bullets) {
      rect(b.getbx(), b.getby(), size/4, size) 
    }
  }
  void updateBullets() {
    while (bullets.size() > 0) {
      bullets.remove(0);
    }
    bullety -= size; 
  }
  
}
