Player player;
Boss boss;
Turret turret;
Turret turret2;
ArrayList<Bullet> bullets;
ArrayList<Enemy> enemies;
ArrayList<EnemyBullet> battack1dead;
boolean started = false;
int size = 30;
int spawnTime = 100;
int count = spawnTime;
int attackTime = 100; 
int attackcount = 0;
int c = 0;
int immunecount = 100;
int wavetime = 0;
boolean incoming = false;
int bossTimer = 0;
float a; 
float a2;
int attack2time = 0;
boolean s = false;

void setup() {
  size(800, 900);
  player = new Player(width/2, height- size * 2, size);
  bullets = new ArrayList<Bullet>();
  enemies = new ArrayList<Enemy>();
  battack1dead = new ArrayList<EnemyBullet>();
  boss = new Boss(width/2, 0);
  turret = new Turret(boss.x - 115, boss.y + 100, boss.getSize());
  turret2 = new Turret(boss.x + 200, boss.y + 100, boss.getSize());

  frameRate(50);
}
void draw() {
  if (started) {
      background(0);
      textSize(25);
      fill(255);
      text("lives: " + player.life, width - 100, height - 10);
      if (wavetime >= 3000 && wavetime <= 3600){
        incoming();
      }
      player.drawPlayer();
      player.move();
      for (Bullet b: bullets) {
         b.drawBullet();
         b.updateBullet();
      }
    if (wavetime <3600) {

  if (!incoming) {
  if (count == spawnTime ) {
    enemies.add(new Enemy(int(random(0, width - size)), 0, size));
    count = 0;
  } else {
    count++;
  }
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
    for (int j = 0; j < bullets.size(); j++) {
      if  (enemycollide(bullets.get(j), enemies.get(i))) {
          Enemy e = enemies.remove(i);  
          if (i > 0) {
            i--;
          }
          while (e.battack1move.size() > 0) {
            EnemyBullet eb = e.battack1move.remove(0);
            battack1dead.add(eb);
          }
          bullets.remove(j);
      } else {
        if (bullets.get(j).getY() < 0) {
           bullets.remove(j);
      }
        }
      }
     if (enemies.size() > 0){
      for (int k = 0; k < enemies.get(i).battack1move.size(); k++) {
        if (playerCollideEBullet(enemies.get(i).battack1move.get(k))){
          if (!player.immune) {
          loseLife();
          }
          enemies.get(i).battack1move.remove(k);
        }
      }
        if (enemies.get(i).getY() > height) {
          player.life--;
            enemies.remove(i);
        //while (enemies.get(i).battack1.size() > 0) {
        //      enemies.get(i).battack1.remove(0);
        //}
    }
    if (playerCollideEnemy(enemies.get(i))) {
      if (!player.immune) {
      loseLife();
      }
    }
     }
  }
        displayDeadBullets();
        updateDeadBullets();
     if (battack1dead.size() > 0) {
       for (int l = 0; l < battack1dead.size(); l++) {
         if (playerCollideEBullet(battack1dead.get(l))) {
          if (!player.immune) {
          loseLife();
          }
           battack1dead.remove(l);
         }
       }
     }
    } else {
      boss.immune = false;
    fill(255);
    textSize(25);
    text("boss life: " + boss.life, 10,  20);
    boss.displayBoss();
    if (boss.life > 0) {
          boss.moveBoss();
  
    if (boss.getY() >= 99) {
         attackSequence();
      if (boss.attacknumber == 1) {
      boss.displayattack1();
      } else {
          
          updateturret(turret);
          updateturret(turret2);
         boss.displayattack21();
         boss.displayattack22();
      }
    if (frameCount % 2 == 0) {
        boss.updateattackSequence();
    }
    }
    for (int i = 0; i < boss.attack1.size(); i++) {
      if (playerCollideBBullet(boss.attack1.get(i))){
        if (!player.immune) {
          loseLife();
        }
        boss.attack1.remove(i);
      } else {
      if (boss.attack1.get(i).bulletOffScreen()) {
        boss.attack1.remove(i);
      }
      }
    }
    }
    for (int i = 0; i < boss.attack21.size(); i++) {
      if (playerCollideBBullet(boss.attack21.get(i))){
        if (!player.immune) {
          loseLife();
        }
        boss.attack21.remove(i);
      } else {
      if (boss.attack21.get(i).bulletOffScreen()) {
        boss.attack21.remove(i);
      }
      }
    }
     for (int i = 0; i < boss.attack22.size(); i++) {
      if (playerCollideBBullet(boss.attack22.get(i))){
        if (!player.immune) {
          loseLife();
        }
        boss.attack22.remove(i);
      } else {
      if (boss.attack22.get(i).bulletOffScreen()) {
        boss.attack22.remove(i);
      }
      }
    }
      if (boss.life <= 0) {
       // boss = new Boss(900, 900);
        victory();
     }
    }
     for (int j = 0; j < bullets.size(); j++) {
        if (bosscollide(bullets.get(j))) {
          if (!boss.immune) {
             boss.life--;
          }
             bullets.remove(j);
        }else {
          if (bullets.get(j).getY() < 0) {
           bullets.remove(j);
      }
     }
     }
     if (player.life <= 0) {
       gameOver();
     }

   if (immunecount == 0) {
     immunecount =100;
     player.immune = false;
   }
   immunecount--;
    wavetime++;    
  } else {
    if (s) {
      settingscreen();
    } else {
    startScreen();
  }
  }
  
}

void startScreen() {
  background(0);
  textSize(50);
  fill(255);
  text("press space to start" , width/ 4, height/2);
  textSize(25);
  text("press s for settings", width/3, height - 10);
  
}

void settingscreen() {
  fill (125, 125, 125);
  rect(width/4, height/4, width/2, height/2);
  fill(0);
  textSize(50);
  text("settings", width/4 + width/8, height/4 + 50);
  textSize(25);
  text("player life: " + player.life, width/4 + 10, height/4 + 150);
  text("boss life: " + boss.life, width/4 + 10, height/4 + 250);
  text("-", width/4 + 210, height/4 + 145, 25);
  text("+", width/4 + 255, height/4 + 145, 25);
  text("-", width/4 + 160, height/4 + 245, 25);
  text("+", width/4 + 205, height/4 + 245, 25);
  noFill();
  square(width/4 + 200, height/4 + 125, 25);
  square(width/4 + 250, height/4 + 125, 25);
  square(width/4 + 150, height/4 + 225, 25);
  square(width/4 + 200, height/4 + 225, 25);
}

void incoming() {
  textSize(50);
  fill(255);
  text("Incoming Boss" , width/ 4, height/2 + height/4);    
  incoming = true;
}

void gameOver() {
  background(255, 85, 96);
  textSize(75);
  fill(255);
  text("Game Over!", width / 4, height/2);
  
}

void victory() {
  background(95, 247, 129);
  textSize(75);
  fill(0);
  text("You win!", width / 4, height/2);
}

void updateturret(Turret t) {
   pushMatrix();
   stroke(0);
    translate(t.x,t.y);
   rotate(atan2(player.getX() - t.x, player.getY() - t.y));
     fill(142, 72, 19);
    circle(0,0,boss.getSize() * 3/4);
    popMatrix();
    pushMatrix();
    fill(125, 125, 125);
   translate(t.x, t.y);
   rotate(-atan2(player.getX() - t.x, player.getY() - t.y));
   rect(-15,-10, boss.getSize()/3, boss.getSize() * 3/4);
   popMatrix();
   
   //boss.gun(boss.x - 100, boss.y + 50);
   //boss.gun(boss.x + 200, boss.y + 50);
}


boolean enemycollide(Bullet b, Enemy e) {
  if (b.getX() >= e.getX() && b.getX() <= e.getX() + size && b.getY() < e.getY() + size && b.getY() > e.getY()) {
      return true;
    }
  return false;
}

boolean bosscollide(Bullet b) {
  if ((b.getX() >= boss.getX() + 20  && b.getX() <= boss.getX() + boss.getSize()- 10 && b.getY() <= boss.getY() + size && b.getY() >= boss.getY()) ||
  (b.getX() + size/4 >= boss.getX() + 20&& b.getX() + size/4<= boss.getX() + boss.getSize()- 10 && b.getY() <= boss.getY() + size && b.getY() >= boss.getY())){
  return true;
}
  return false;
}

boolean playerCollideBBullet(BossBullet b) {
      if (boss.attacknumber == 2) {
             if ((b.text.x >= player.getX() && b.text.x <= player.getX() + size  && b.text.y <= player.getY() + size && b.text.y  > player.getY()) || 
  (b.text.x+ b.size>= player.getX() && b.text.x + b.size<= player.getX() + size && b.text.y < player.getY() + size && b.text.y> player.getY())) {
           return true;
         }
      } else {
      if (b.pos.x >= player.getX() && b.pos.x <= player.getX() + size && b.pos.y < player.getY() + size && b.pos.y > player.getY()) {
         return true;
      }
      }
      return false;
}

boolean playerCollideEBullet(EnemyBullet b) {
      if (b.pos.x >= player.getX() && b.pos.x <= player.getX() + size && b.pos.y < player.getY() + size && b.pos.y > player.getY()) {
         return true;
      }
      return false;
}

boolean playerCollideEnemy(Enemy e) {
  if ((e.getX() >= player.getX() && e.getX() <= player.getX() + size && e.getY() + size < player.getY() + size && e.getY() +size > player.getY()) || 
  (e.getX() + size >= player.getX() && e.getX() + size <= player.getX() + size && e.getY() + size < player.getY() + size && e.getY() + size> player.getY())) {
         return true;
      }
      return false;
}

void attackSequence() {
  if (!boss.attack1done) {
    if (frameCount % 2 == 0) {
    boss.attack1();
    }
  } else {
    if (frameCount % 30 == 0) {
      attack2();
    }
  }
}

void attack2() {
    if (attack2time < 50) {
      boss.attacknumber = 2;
      attack2time++;
    } else {
      attack2time = 0;
      boss.attacknumber = 1;
      boss.attack1done = false;
      boss.switchcount = 0;
    }
    //float a = -atan((player.getX() - turret.x) / (turret.y - player.getY()));
    a = atan2(player.getX() - turret.x, player.getY() - turret.y);
    //float a2 = -atan((player.getX() - turret2.x) / (turret2.y - player.getY()));
    a2 = atan2(player.getX() - turret2.x, player.getY() - turret2.y);
    boss.attack21.add(new BossBullet(turret.x , turret.y +10, size + 10, 1, 1, a));
    boss.attack22.add(new BossBullet(turret2.x, turret2.y + 10, size + 10, -1, 1, a2));
}
void load() {

  for (Enemy e: enemies) {
   //while (e.battack1.size() > 0) {
   //       e.battack1.remove(0);
   //}
      e.battack1.add( new EnemyBullet(e.getX() + size + 50, e.getY(), size/ 2));
      e.battack1.add(new EnemyBullet(e.getX() + size + 25, e.getY() + size + 25, size / 2));
      e.battack1.add(new EnemyBullet(e.getX() - 25, e.getY() + size + 25, size / 2));
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

void displayDeadBullets() {
  for (EnemyBullet b: battack1dead) {
     b.drawBullet();
  }
}

void updateDeadBullets() {
   for (int i = 0; i < battack1dead.size(); i++) {
      if (battack1dead.get(i).bulletOffScreen()) {
        battack1dead.remove(i);
      } 
    }
    for (int i = 0; i < battack1dead.size(); i++) {
      battack1dead.get(i).updateBullet1();
    }
}

void loseLife() {
  player.life--;
  player.immune = true;
}

void mousePressed() {
  if (mouseX >= width/4 + 200 && mouseX <= width/4 + 225 && mouseY >= height/4 + 125 && mouseY <= height/4 + 150) {
    player.life--;
  } else if (mouseX>= width/4 + 150 && mouseX <= width/4 + 175 && mouseY >= height/4 + 225 && mouseY <= height/4 + 250) {
    boss.life--;
  } else if  (mouseX>= width/4 + 250 && mouseX <= width/4 + 275 && mouseY >= height/4 + 125 && mouseY <= height/4 + 150) {
    player.life++;
  } else if  (mouseX>= width/4 + 200 && mouseX <= width/4 + 225 && mouseY >= height/4 + 225 && mouseY <= height/4 + 250) {
    boss.life++;
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
 }
 if (key == ' ') {
   started = true;
 }
 if (key == 's') {
   s = true;
 }
 if (key == 'e') {
   s = false;
 }
}
  void keyReleased() {
  if (keyCode == UP) {

    player.up = false;
 } 
 if (keyCode == DOWN) {

   player.down = false;
 }
 if (keyCode == LEFT) {

  player.left = false;
 } 
 if (keyCode == RIGHT) {

   player.right =false;
 } 
}
