public class Game {
Player player;
ArrayList<Bullet> bullets;
ArrayList<Enemy> enemies;
//Bullet bullet;
int size = 30;
int spawnTime = 300;
int count = spawnTime;
//boolean firstappear = true;
int attackTime = 3; 
int attackcount = 0;
//int capacity = 3;
void setup() {
  size(800, 900);
  background(0);
 // rectMode(CENTER);
  player = new Player(width/2, height- size * 2, size);
  bullets = new ArrayList<Bullet>();
  enemies = new ArrayList<Enemy>();
  //bullet = new Bullet(width/2, height - size * 2, size);
}
void draw() {
  background(0);
  textSize(25);
  fill(255);
  text("lives: " + player.life, width - 100, height - 10);
  player.drawPlayer();
    player.move();
    //player bullets
  for (Bullet b: bullets) {
     b.drawBullet();
     b.updateBullet();
     b.shouldRemove();

  }

  if (count == spawnTime ) {
   // if (enemies.size() <= capacity) {
    enemies.add(new Enemy(int(random(0, width - size)), 0, size));
    //}
    //println(enemies.size());
    count = 0;
  } else {
    count++;
  }
  for (Enemy e: enemies) {
    e.drawEnemy();
      if (attackcount == attackTime) {
         attackcount = 0;
        load();
        e.attack1();
      //e.active = false;
    
      //println(e.battack1.get(0).dirx);

      //for (int i = 0; i < e.bulletcapacity; i++) {
      //  //e.battack1.add(new EnemyBullet(e.getX() + size + ((i + 1)* 100), e.getY() + size + ((i + 1)* 100)));
      //  e.battack1.add(new EnemyBullet(e.getX() + size + 50, e.getY() + size , size/2));
      //}
    //} else {
    //  e.updateEnemy();
    //  attackcount++;
    //}
  } else {
    e.updateattack1();
    e.attack1();
    e.updateEnemy();
  }
  }
  attackcount++;
  //firstappear = false;
  for (int i = 0; i < enemies.size() - 1; i++) {
    Enemy e= enemies.get(i);
    //println(e);
    if (e.getY() > height || collide()) {
      enemies.remove(e);
    }
  }
  for (int i = bullets.size() - 1; i > -1; i--) {
    Bullet b = bullets.get(i);
   if (b.getremove() || collide()) {
      bullets.remove(i);
    }
  }
  playercollide();
  if (player.life <= 0) {
    //gameover screen
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

void playercollide() {
  for (Enemy e: enemies) {
  for (EnemyBullet b: e.battack1) {
    if (b.pos.x >= player.getX() && b.pos.x <= player.getX() + size && b.pos.y < player.getY() + size && b.pos.y > player.getY()) {
      player.life--;
    }
  }
  }
}
void load() {

  for (Enemy e: enemies) {
   while (e.battack1.size() > 0) {
          e.battack1.remove(0);
   }
      e.battack1.add(new EnemyBullet(e.getX() + size + 50, e.getY(), size/ 2));
      e.battack1.get(0).diry = 0;    
      e.battack1.get(0).dirx = 1;
      e.battack1.add(new EnemyBullet(e.getX() - 50, e.getY(), size / 2));
      e.battack1.get(1).diry = 0;
      e.battack1.get(1).dirx = -1;
      e.battack1. add(new EnemyBullet(e.getX() + size + 25, e.getY() + size + 25, size / 2));
      e.battack1.get(2).dirx = 1;
      e.battack1.get(2).diry = 1;
      e.battack1. add(new EnemyBullet(e.getX() - 25, e.getY() + size + 25, size / 2));
      e.battack1.get(3).dirx = -1;
      e.battack1.get(3).diry = 1;
  }
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
