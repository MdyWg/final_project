class Bullet {
  //private int bulletx;
  //private int bullety;
  private int size;
  private PVector pos;
  
  ArrayList<PVector> bulletpos = new ArrayList<PVector>();
  public Bullet(float x, float y, int size) {
    pos.x = x;
    pos.y = y;
    this.size = size;
  }
  public Bullet(int size) {
    this.size = size;
    
  }
  //int getbx(){
  //  return bulletx;
  //}
  //int getby() {
  //  return bullety;
  //}
   void drawBullets() {
    for (PVector b: bulletpos) {
      fill(255);
      rect(b.x,b.y, size/4, size);
    }
  }
    void updateBullets() {
    //while (bullets.size() > 0) {
    //  bullets.remove(0);
    //}
    if (bulletpos.get(0).y <= 5) {
      bulletpos.remove(0);
    }
    for (PVector b: bulletpos) {
       b.y -= size; 
    }
  }
  
}
