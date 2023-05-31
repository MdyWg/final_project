public class Player {
 // private PVector pos;
 private int x;
 private int y;
  private int size; 
 int waitShoot;
  boolean canShoot = true;
  boolean left;
  boolean right;
  boolean up; 
  boolean down;
  private int speed;
 // private ArrayList<Bullet> bullets = new ArrayList<Bullet>();
  public Player(int x, int y, int size){
  //  pos = new PVector(x, y);
    this.x = x;
    this.y = y;
    this.size = size;   
    left = false;
    right = false; 
    up = false; 
    down = false; 
    speed = 3;
  }
  int getX() {
    return x;
  }
  int getY() {
    return y;
  }
  void drawPlayer() {
    fill(255);
    square(x, y, size);
  }
 
  void move() {
    if (left) {
      x -= speed;
    }
    if (right) {
      x += speed;
    }
    if (up) {
      y -= speed;
    }
    if (down) {
      y += speed;
    }
  }
  
  //void shoot() {
  //  Bullet bullet = new Bullet(int(pos.x), int(pos.y), size);
  //  bullets.add(bullet);
  //}
  //void drawBullets() {
  //  for (Bullet b: bullets) {
  //    b.drawBullet();
  //  }
  //}
}
