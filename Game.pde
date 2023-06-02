public class Game {
Player player;
ArrayList<Bullet> bullets;
ArrayList<Enemy> enemies;
//Bullet bullet;
int size = 30;
int spawnTime = 200;
int count = spawnTime;
int attackTime = 3; 
int count2 = 0;
void setup() {
  size(800, 900);
  background(0);
  player = new Player(width/2, height- size * 2, size);
  bullets = new ArrayList<Bullet>();
  enemies = new ArrayList<Enemy>();
  //bullet = new Bullet(width/2, height - size * 2, size);
}
void draw() {
  background(0);
  player.drawPlayer();
    player.move();
  for (Bullet b: bullets) {
     b.drawBullet();
     b.updateBullet();
     b.shouldRemove();
  }
  if (count == spawnTime ) {
    enemies.add(new Enemy(int(random(0, width - size)), 0, size));
    count = 0;
  } else {
    count++;
  }
  for (Enemy e: enemies) {
    e.drawEnemy();
    if (count2 == attackTime) {
      count2 = 0;
      for (int i = 0; i < e.capacity; i++) {
        e.battack1.add(new Bullet(e.getX() + i* 100, e.getY() + i* 100, size));
      }
      e.attack1();
    } else {
     if (e.getActive()) {
       e.updateattack1();
     }
    e.updateEnemy();
    count2++;
    }
  }
  for (int i = 0; i < enemies.size() - 1; i++) {
    Enemy e= enemies.get(i);
    if (e.getY() > height || collide()) {
      enemies.remove(e);
      break;
    }
  }
  for (int i = bullets.size() - 1; i > -1; i--) {
    Bullet b = bullets.get(i);
   if (b.getremove() || collide()) {
      bullets.remove(i);
    }
  }
  //if (waitenemy ==5) {
    
  //}
}

boolean collide() {
  for (Enemy e: enemies) {
  for (Bullet b: bullets) {
    if (b.getX() >= e.getX() && b.getX() <= e.getX() + size && b.getY() < e.getY() + size && b.getY() > e.getY()) {
      return true;
    }
  }
  }
  return false;
}

  void keyPressed() {
  if (keyCode == UP) {
   //dir = new PVector(0, -1);
    //player.y -= 5;
    player.up = true;
 } 
 if (keyCode == DOWN) {
   //dir = new PVector(0, 1);
   //player.y += 5;
   player.down = true;
 }
 if (keyCode == LEFT) {
   //dir = new PVector(-1, 0);
  // player.x -= 5;
  player.left = true;
 } 
 if (keyCode == RIGHT) {
   //dir = new PVector(1, 0);
   //player.x += 5;
   player.right = true;
 } 
 if (key == 'j') {
    if (player.canShoot) {
      bullets.add(new Bullet(player.getX(), player.getY(), size));
      player.waitShoot = 0;
      player.canShoot = false;
    } else {
      player.waitShoot++;
      if (player.waitShoot == 7) {
        player.canShoot = true;
      }
    }
   //player.shoot();
 }
}
  void keyReleased() {
  if (keyCode == UP) {
   //dir = new PVector(0, -1);
    //player.y -= 5;
    player.up = false;
 } 
 if (keyCode == DOWN) {
   //dir = new PVector(0, 1);
   //player.y += 5;
   player.down = false;
 }
 if (keyCode == LEFT) {
   //dir = new PVector(-1, 0);
  // player.x -= 5;
  player.left = false;
 } 
 if (keyCode == RIGHT) {
   //dir = new PVector(1, 0);
   //player.x += 5;
   player.right =false;
 } 
}
}
