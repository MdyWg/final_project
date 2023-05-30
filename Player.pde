public class Player{
  //private int posx;
  //private int posy;
  private int size;
  private PVector pos;
  private boolean canShoot = true;
  private int waitShoot;
    //ArrayList<Bullet> bullets = new ArrayList<Bullet>();
  public Player(int x, int y, int size) {
    pos.x = x;
    pos.y = y;
    this.size = size;
    
  }
  //int getX() {
  //  return posx;
  //}
  //int getY() {
  //  return posy;
  //}
  void updatePlayer() {
    fill(255);
    square(pos.x, pos.y, size);
  }
  void shoot() {
    Bullet b = new Bullet(pos.x + size / 2, pos.y, size);
    if (canShoot) {
      b.bulletpos.add(new PVector(pos.x + size/ 2, pos.y, size));
      waitShoot = 0;
      canShoot = false;
    } else {
      waitShoot++;
      if (waitShoot == 5) {
        canShoot = true;
      }
      
    }
  }
  
  
}
