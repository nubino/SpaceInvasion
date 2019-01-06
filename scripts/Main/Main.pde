// Main class used to launch the application

Player player1;
ArrayList <Bullet> bullets;
Enemy [] enemy = new Enemy[8];
private float cRadiant = 0;//radian measure counter for enemy movement
Boolean dPressed = false;
Boolean aPressed = false;
Boolean spacePressed = false;

void setup()
{
  size(1280, 720);
  frameRate(144);
//noCursor();
  
//PLAYERS
  player1 = new Player(new PVector(width / 2, height - height / 8), 0.5f, 3);
  player1.setSprite("Player.PNG");

//ENEMIES
  for(int i = 0 ; i<8 ; i++){
    enemy[i]= new Enemy(new PVector(i*160+80, -height / 8), 0.5f);
    enemy[i].setSprite("Player.PNG");
  }
  
//BULLETS
  bullets = new ArrayList();
}

void draw()
{
  background(#ffffff);
  
//PLAYERS
  player1.display();
  controlls();
  
//ENEMIES
  cRadiant = cRadiant+0.03125;//Enemy X-movement
  for(int i=0 ; i< enemy.length ; i++){
  enemy[i].display();//??
  }

//BULLETS
  for(Bullet temp : bullets) {
    temp.move();
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
  //setOrigin(new PVector(mouseX, getOrigin().y));
  if(aPressed){
    player1.move("LEFT");
  }
  if(dPressed){
    player1.move("RIGHT");
  }
  if(spacePressed){//TODO fires a bullet every frame, cooldown Timer needed
    Bullet temp = new Bullet("Laser.PNG", player1.getOrigin(), new PVector(0,-10), 20);
    bullets.add(temp);
  }
}
