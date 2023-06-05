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
  
    
}
