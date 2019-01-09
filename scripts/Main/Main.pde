// Main class used to launch the application
private Button button1;
private Button button2;
private Button button3;
private UI u1 = new UI();
private Logo logo1;
private PImage logo;
PFont font1;
private int timer;
private int wave = 0;
private long lvl1millis;
private long lvl1time;

private Player player1;
int weaponMode = 0;
private ArrayList <Bullet> bullets;
private ArrayList <Rocket> rockets;
private Laser laser1;
private ArrayList <Enemy> enemies = new ArrayList();

public int score = 0;
public int scene = 0;
public boolean darkmode = true;

private Boolean dPressed = false;
private Boolean aPressed = false;
private Boolean spacePressed = false;
private Boolean sPressed = false;

public void setup()
{
//SYSTEM
  registerMethod("pre", this);
  
//INTERFACE
  size(1280, 720);
  frameRate(60);
  u1.starSetup();
  button1 = new Button(new PVector(width/2, height/2), new PVector(width/2, height/8), 64, 1, "DARKMODE TOGGLE");
  button1.buttonSetup();
  button2 = new Button(new PVector(width/2, height/2 - height / 6), new PVector(width/2, height/8), 64, 1, "START GAME");
  button2.buttonSetup();
  button3 = new Button(new PVector(width/2, height/2 + height / 6), new PVector(width/2, height/8), 64, 1, "EXIT");
  button3.buttonSetup();
  logo = loadImage("Logo.png");
  logo1 = new Logo(new PVector(width/2, height/2 - height / 3));
  font1 = createFont("ZCOOLQingKeHuangYou-Regular.ttf",40);
  
//noCursor();

//PLAYERS
  player1 = new Player(new PVector(width / 2, height - height / 8), 0.5f, 3);
  player1.setSprite("Player.PNG");

//ENEMIES
  for(int i = 0 ; i<8 ; i++){
    Enemy t = new Enemy(new PVector(i*160+80, -height / 8), 0.5f, 10);
    t.setSprite("Player.PNG");
    enemies.add(t);
  }
  
//WEAPONS
  bullets = new ArrayList();
  rockets = new ArrayList();
  laser1 = new Laser(player1.getOrigin(), "Laser.png", 1f, 9001 );
}


public void pre() // used to update positions and other atributes
{
  lvl1millis = millis() - lvl1time;
  scene1("PRE");
}

public void draw()// used to display
{
  //println((int)frameRate);
  scene1("DRAW");
  scene0("DRAW");
}

//████████╗██╗████████╗██╗     ███████╗███████╗ ██████╗██████╗ ███████╗███████╗███╗   ██╗
//╚══██╔══╝██║╚══██╔══╝██║     ██╔════╝██╔════╝██╔════╝██╔══██╗██╔════╝██╔════╝████╗  ██║
//   ██║   ██║   ██║   ██║     █████╗  ███████╗██║     ██████╔╝█████╗  █████╗  ██╔██╗ ██║
//   ██║   ██║   ██║   ██║     ██╔══╝  ╚════██║██║     ██╔══██╗██╔══╝  ██╔══╝  ██║╚██╗██║
//   ██║   ██║   ██║   ███████╗███████╗███████║╚██████╗██║  ██║███████╗███████╗██║ ╚████║
//   ╚═╝   ╚═╝   ╚═╝   ╚══════╝╚══════╝╚══════╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚══════╝╚═╝  ╚═══╝
                                                                                       
private void scene0(String selection)
{
  if(scene == 0 && selection == "DRAW")
  {
    background(#ffffff);
    
    button1.display();
    if(button1.clicked()){darkmode = !darkmode;}
    button2.display();
    if(button2.clicked())
    {
      score = 0;
      weaponMode = 0;
      wave = 0;
      lvl1time = millis();
      enemies.removeAll(enemies);
      scene = 1;
    }
    button3.display();
    if(button3.clicked()){exit();}
    logo1.display();
    
    textFont(font1);
    textSize(40);
    fill(0);
    textAlign(CENTER, CENTER);
    if(score != 0){text("GAME OVER! Your Score: " + score, width / 2 - width / 4, height / 2 - height / 8 + height / 3, width / 2, height / 8); }
  }
  
  //POSTPROCESSING
  if(darkmode){filter(INVERT);}
  
}

//██╗     ███████╗██╗   ██╗███████╗██╗     ██╗
//██║     ██╔════╝██║   ██║██╔════╝██║    ███║
//██║     █████╗  ██║   ██║█████╗  ██║    ╚██║
//██║     ██╔══╝  ╚██╗ ██╔╝██╔══╝  ██║     ██║
//███████╗███████╗ ╚████╔╝ ███████╗███████╗██║
//╚══════╝╚══════╝  ╚═══╝  ╚══════╝╚══════╝╚═╝                                            

private void scene1(String selection)
{
  
  if(scene == 1 && selection == "PRE")
  {
//PLAYERS
  controlls();
  
//WEAPONS
  //BULLET
  for(int i = 0; bullets.size() != 0 && i < bullets.size(); i++) {
    bullets.get(i).move();
    for(int j = 0; enemies.size() != 0 && j < enemies.size(); j++){
      if(bullets.get(i).hitdetection( enemies.get(j).getOrigin(), enemies.get(j).getSize())){
        if(enemies.size() != 0){enemies.remove(enemies.get(j)); score++;}
        //if(bullets.size() != 0){ bullets.remove(bullets.get(i));}
      }
    }
  if(bullets.size() != 0){ if(bullets.get(i).getOrigin().y < 0){bullets.remove(bullets.get(i));}}
  }
  }
  //ROCKET
  for(int i = 0; rockets.size() != 0 && i < rockets.size(); i++) {
    rockets.get(i).move();
  }

//ENEMIES
  if(lvl1millis >= 5000 && wave == 0){
  for(int i = 0 ; i<8 ; i++){
    print("HEYYYY");
    Enemy t = new Enemy(new PVector(i*160+80, -height / 8), 0.5f, 10  );
    t.setSprite("Player.PNG");
    enemies.add(t);
    wave = 1;
    }
  }
  
  if(lvl1millis >= 20000 && wave == 1){
  for(int i = 0 ; i<8 ; i++){
    Enemy t = new Enemy(new PVector(i*160+80, -height / 8), 0.5f, 10  );
    t.setSprite("Player.PNG");
    enemies.add(t);
    wave = 2;
    }
  }
  if(lvl1millis >= 23000 && wave == 2){
  for(int i = 0 ; i<8 ; i++){
    Enemy t = new Enemy(new PVector(i*160+80, -height / 8), 0.5f, 10  );
    t.setSprite("Player.PNG");
    enemies.add(t);
    wave = 3;
    }
  }
  
  else if(scene == 1 && selection == "DRAW")
  {
//INTERFACE
  background(#ffffff);
  u1.stars();
  textSize(32);
  fill(0);
  text(score, 10, 30); 
  
//PLAYERS
  player1.display();
  
//ENEMIES
  for(int i = 0; enemies.size() != 0 && i < enemies.size(); i++){
    enemies.get(i).display();
    if(enemies.get(i).getOrigin().y > height)
    {
      wave = 0;
      lvl1time = millis();
      enemies.removeAll(enemies); scene = 0;
    }
  }
  
//WEAPONS
  for(Bullet temp : bullets) {
    temp.display();
  }
  for(Rocket rock : rockets){
    rock.display();  
  }
  if(spacePressed && weaponMode == 2){
    laser1.display(player1.getOrigin().x);
  }
  
//POSTPROCESSING
  }
}

public void keyPressed() {
if(key == 'a'){ aPressed = true;}
if(key == 'd'){ dPressed = true;}
if(key == ' '){ spacePressed = true;}
if(key == 's'){ sPressed = true;}
}

public void keyReleased() {
  if(key == 'a'){ aPressed = false;}
  if(key == 'd'){ dPressed = false;}
  if(key == ' '){ spacePressed = false;}
  if(key == 's'){ 
    if(weaponMode == 0 && sPressed && scene != 0){
      weaponMode = 1;
      sPressed = false;
      print(weaponMode);
    }else if(weaponMode == 1 && sPressed && scene != 0){
      weaponMode = 2;
      sPressed = false;
      print(weaponMode);
    }else if(weaponMode == 2 && sPressed && scene != 0){
      weaponMode = 0;
      sPressed = false;
      print(weaponMode);
    }
  }
}

public void mouseReleased() {
  button1.mouseP = true;
  button2.mouseP = true;
  button3.mouseP = true;
}

private void controlls(){
  //Mouse controls
  //player1.setOrigin(new PVector(mouseX, player1.getOrigin().y));
  
  //Keyboard controls
  if(aPressed){
    player1.move("LEFT");
  }
  if(dPressed){
    player1.move("RIGHT");
  }
  if(spacePressed && millis() > timer + 500 && weaponMode == 0){ //BULLET
    Bullet temp = new Bullet(player1.getOrigin(), "Bullet.PNG", 1f, new PVector(0,-10), 20);
    bullets.add(temp);
    timer = millis();
    println(lvl1millis);
  }else if(spacePressed && millis() > timer + 1000 && weaponMode == 1){ //ROCKET
    Rocket rock = new Rocket(player1.getOrigin(), "Rocket.png", 1f, 40);
    rockets.add(rock);
    timer = millis();
  }else if(spacePressed && weaponMode == 2){ //LASER
    
    laser1.display(player1.getOrigin().x);
  }
}
class Time
{
  public float deltaTime;
  public int seconds;
}
