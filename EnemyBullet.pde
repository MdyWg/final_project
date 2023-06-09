class EnemyBullet{
  PVector pos;
  private int size;
  int dirx; 
  int diry;
  EnemyBullet(int x, int y, int size) {
    this.size = size;
    pos = new PVector(x, y);
  }
  void drawBullet() {
    fill(255, 178, 23);
    circle(pos.x, pos.y, size);
  }
  void updateBullet1() {
      pos.x += 5 * dirx;
      pos.y += 5* diry;
  }
   boolean bulletOffScreen() {
    if (pos.x < 0 || pos.x > 900 || pos.y < 0 || pos.y > 900) {
      return true;
    }
  return false;
  }
  
    
}
