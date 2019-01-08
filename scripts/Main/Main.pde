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
//SYSTEM
  registerMethod("pre", this);
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

void pre() // used to update positions and other atributes
{
//PLAYERS
  controlls();

//ENEMIES
  cRadiant = cRadiant+0.03125;//Enemy X-movement
  
//BULLETS
  for(int i = 0; bullets.size() != 0 && i < bullets.size(); i++) {
    bullets.get(i).move();
    for(int j = 0; enemies.size() != 0 && j < enemies.size(); j++){
      if(bullets.get(i).hitdetection( enemies.get(j).getOrigin(), enemies.get(j).getSize())){
        if(enemies.size() != 0){enemies.remove(enemies.get(j));}
      }
    }
  if(bullets.size() != 0){ if(bullets.get(i).getOrigin().y < 0){bullets.remove(bullets.get(i));}}
  }
}

void draw()// used to display
{
//INTERFACE
  background(#ffffff);
  u1.stars();
  
//PLAYERS
  player1.display();
  
//ENEMIES
  //for(int i=0 ; i< enemy.length ; i++){
  //enemy[i].display();
  //}
  for(Enemy t : enemies) {
    t.display();
  }

//BULLETS
  for(Bullet temp : bullets) {
    temp.display();
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
