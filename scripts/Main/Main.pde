// Main class used to launch the application

Player player1;
ArrayList <Bullet> bullets;
private int i;
Enemy [] enemy = new Enemy[8];
private float cRadiant = 0;//radian measure counter for enemy movement

void setup()
{
  size(1280, 720);
  frameRate(144);
  noCursor();
  
//PLAYERS
  player1 = new Player(new PVector(width / 2, height - height / 8), 0.5f);
  player1.setSprite("Player.PNG");

//ENEMIES
  for(i = 0 ; i<8 ; i++){
    enemy[i]= new Enemy(new PVector(i*160+80, -height / 8), 0.5f);
    enemy[i].setSprite("Player.PNG");
  }
  
//WEAPONS
  bullets = new ArrayList();
}

void draw()
{
  background(#ffffff);
  
//PLAYERS
  player1.display();
  player1.controll();
  
//ENEMIES
  cRadiant = cRadiant+0.03125;//Enemy X-movement
  for(i=0 ; i< enemy.length ; i++){
  enemy[i].display();//??
  }
  
  moveAll();
 filter(INVERT);
}

void keyTyped() {
  
      Bullet temp = new Bullet("Bullet.PNG", player1.getPosition(), new PVector(0,-10), 20);
      bullets.add(temp);
}

void moveAll()
{
  for(Bullet temp : bullets)
  {
    temp.move();
  }
}
