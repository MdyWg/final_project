Player player;
ArrayList<Bullet> bullets;
ArrayList<Enemy> enemies;
ArrayList<EnemyBullet> battack1move;
//Bullet bullet;
int size = 30;
int spawnTime = 200;
int count = spawnTime;
//boolean firstappear = true;
int attackTime = 50; 
int attackcount = 0;
int c = 0;
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
         e.active = true;
        load();
        e.displayload();
  } else {
    if (e.active) {
      e.updateattack1();
      e.displayattack1();
    }
   e.updateEnemy();
   attackcount++;
  }
  }
  for (int i = 0; i < enemies.size(); i++) {
    //Enemy e = enemies.get(i);
    for (int j = 0; j < bullets.size(); j++) {
      //Bullet b = bullets.get(j);
      if  (enemycollide(bullets.get(j), enemies.get(i))) {
          //println(enemycollide(bullets.get(j), enemies.get(i)));
          enemies.remove(i);     
          bullets.remove(j);
      } else {
        if (bullets.get(j).getY() < 0) {
           bullets.remove(j);
      }
          if (enemies.get(i).getY() > height) {
            player.life--;
            enemies.remove(i);
            while (enemies.get(i).battack1.size() > 0) {
              enemies.get(i).battack1.remove(0);
            }
        }
      }
  }
  }
  //for (int i = 0; i < enemies.size() - 1; i++) {
  //  Enemy e= enemies.get(i);
  //  //println(e);
  //  if (e.getY() > height || enemycollide()) {
  //    enemies.remove(e);
  //  }
  //}
  //for (int i = bullets.size() - 1; i > -1; i--) {
  //  Bullet b = bullets.get(i);
  // if (b.getremove() || enemycollide()) {
  //    bullets.remove(i);
  //  }
  //}
  //if (player.life <= 0) {
  //  //gameover screen
  //}

}


boolean enemycollide(Bullet b, Enemy e) {
  if (b.getX() >= e.getX() && b.getX() <= e.getX() + size && b.getY() < e.getY() + size && b.getY() > e.getY()) {
      return true;
    }
  return false;
}

boolean playercollide(EnemyBullet b) {
      if (b.pos.x >= player.getX() && b.pos.x <= player.getX() + size && b.pos.y < player.getY() + size && b.pos.y > player.getY()) {
         return true;
      }
      return false;
}
//void enemybulletmove() {
//  for (Enemy e: enemies) {
//  for (EnemyBullet b: e.battack1move) {
//     else if (e.bulletOffScreen()) {
//      e.battack1move.remove(b);
//    }
//    else {
//      e.updateattack1();
//      e.attack1move();
//    }
//  }
//  }
//}
void load() {

  for (Enemy e: enemies) {
   //while (e.battack1.size() > 0) {
   //       e.battack1.remove(0);
   //}
      e.battack1.add( new EnemyBullet(e.getX() + size + 50, e.getY(), size/ 2));
      e.battack1. add(new EnemyBullet(e.getX() + size + 25, e.getY() + size + 25, size / 2));
      e.battack1. add(new EnemyBullet(e.getX() - 25, e.getY() + size + 25, size / 2));
      e.battack1.add(new EnemyBullet(e.getX() - 50, e.getY(), size / 2));
     
      while (e.battack1.size() >0) {
        EnemyBullet bullet = e.battack1.remove(0);
        e.battack1move.add(bullet);
        if (c == 0) {
          e.battack1move.get(e.battack1move.size() - 1).diry = 0;
          e.battack1move.get(e.battack1move.size() - 1).dirx = 1;
        } else if (c == 1) {
          e.battack1move.get(e.battack1move.size() - 1).diry = 1;
          e.battack1move.get(e.battack1move.size() - 1).dirx = 1;
      } else if (c == 2) {
         e.battack1move.get(e.battack1move.size() - 1).diry = 1;
         e.battack1move.get(e.battack1move.size() - 1).dirx = -1;
      } else {
         e.battack1move.get(e.battack1move.size() - 1).diry = 0;
         e.battack1move.get(e.battack1move.size() - 1).dirx = -1;
      }
      if (c == 3) {
        c = 0;
      } else {
        c++;
      }
      }
      
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
