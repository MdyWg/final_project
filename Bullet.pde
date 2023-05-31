class Bullet {
  private int size; 
  private int x;
  private int y;
  private int speed;
  private boolean remove;
  public Bullet(int x, int y, int size) {
    //bulletpos = new PVector(x, y);
    this.x = x;
    this.y = y;
    this.size = size;
    speed = size;
  }
   int getX() {
    return x;
  }
  int getY() {
    return y;
  }
  boolean getremove() {
    return remove;
  }
  void drawBullet() {
    fill(255);
    rect(x, y, size/4, size);
  }
  void updateBullet() {
    y -= speed;
  }
  void shouldRemove() {
    if (y < 0) {
      remove = true;
    }
  }
}
