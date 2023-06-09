class BossBullet {
  PVector pos= new PVector(0,0);
  private int size;
  private float dirx;
  private float diry;
  private int speed = 5;
  private int bulletType = 1;
  PVector text = new PVector(0,0);
  private float angle;
  public BossBullet(int size) {
    this.size = size;
  }
  public BossBullet(int x, int y, int size, float dirx, float diry, float angle) {
    this.size = size;
    this.dirx = dirx;
    this.diry = diry;
    this.angle = angle;
    text.x= x;
    text.y = y;
    pos = new PVector(x, y);
  }
  int getSize() {
    return size;
  }
  void drawBullet() {
    if (bulletType == 1) {
      fill(64, 255, 107);
      circle(pos.x, pos.y, size);
    } else if (bulletType == 2) {
      fill(40, 188, 0);
      textSize(size);
      text("$", text.x, text.y);
    }
  }
  void updateBullet() {
    if (bulletType == 1) {
    pos.x += speed * dirx;
    pos.y += speed * diry;
    } else {
      //println("before " + text.y);
      text.x += speed * sin(angle);
      text.y += speed * cos(angle);
      //println("after " + text.y);
      
    }
  }
     boolean bulletOffScreen() {
    if (pos.x < 0 || pos.x > 900 || pos.y < 0 || pos.y > 900) {
      return true;
    }
  return false;
  }
}
