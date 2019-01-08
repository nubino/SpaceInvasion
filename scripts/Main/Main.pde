// Main class used to launch the application

Player player1;
ArrayList <Bullet> bullets;
//Enemy [] enemy = new Enemy[8];
ArrayList <Enemy> enemies = new ArrayList();
UI u1 = new UI();
private float cRadiant = 0;//radian measure counter for enemy movement
Boolean dPressed = false;
Boolean aPressed = false;
Boolean spacePressed = false;

void setup()
{
//INTERFACE
  size(1280, 720);
  frameRate(144);
  u1.starSetup();
//noCursor();

//PLAYERS
  player1 = new Player(new PVector(width / 2, height - height / 8), 0.5f, 3);
  player1.setSprite("Player.PNG");

//ENEMIES
  for(int i = 0 ; i<8 ; i++){
    Enemy t = new Enemy(new PVector(i*160+80, -height / 8), 0.5f);
    t.setSprite("Player.PNG");
    enemies.add(t);
    //enemy[i]= new Enemy(new PVector(i*160+80, -height / 8), 0.5f);
    //enemy[i].setSprite("Player.PNG");
  }
  
//BULLETS
  bullets = new ArrayList();
}

void draw()
{
//INTERFACE
  background(#ffffff);
  u1.stars();
  
//PLAYERS
  player1.display();
  controlls();
  
//ENEMIES
  cRadiant = cRadiant+0.03125;//Enemy X-movement
  //for(int i=0 ; i< enemy.length ; i++){
  //enemy[i].display();
  //}
  for(Enemy t : enemies) {
    t.display();
  }

//BULLETS
  for(Bullet temp : bullets) {
    temp.move();
    temp.display();
    //for(int j=0 ; j< 8 ; j++){//looking if a bullet hits an enemy
    //  if(temp.hitdetection( enemy[j].getOrigin(), enemy[j].getSize())){
    //    print("BUTZ ");

    //  }
    for(Enemy t : enemies){
      if(temp.hitdetection( t.getOrigin(), t.getSize())){
        print("BUTZ ");
      }
    }
  }
  
//POSTPROCESSING
 filter(INVERT);
}

void keyPressed() {
if(key == 'a'){ aPressed = true;}
if(key == 'd'){ dPressed = true;}
if(key == ' '){ spacePressed = true;}
}

void keyReleased() {
if(key == 'a'){ aPressed = false;}
if(key == 'd'){ dPressed = false;}
if(key == ' '){ spacePressed = false;}
}

public void controlls(){
  //Mouse controls
  //player1.setOrigin(new PVector(mouseX, player1.getOrigin().y));
  if(aPressed){
    player1.move("LEFT");
  }
  if(dPressed){
    player1.move("RIGHT");
  }
  if(spacePressed){//TODO fires a bullet every frame, cooldown Timer needed
    Bullet temp = new Bullet(player1.getOrigin(), "Laser.PNG", 1f, new PVector(0,-10), 20);
    bullets.add(temp);
  }
}
