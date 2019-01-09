// Main class used to launch the application
private Button button1;
private Button button2;
private Button button3;
private UI u1 = new UI();

private Player player1;
private ArrayList <Bullet> bullets;
private ArrayList <Enemy> enemies = new ArrayList();

public int score = 0;
public int scene = 0;
public boolean darkmode = true;

private Boolean dPressed = false;
private Boolean aPressed = false;
private Boolean spacePressed = false;

public void setup()
{
//SYSTEM
  registerMethod("pre", this);
//INTERFACE
  size(1280, 720);
  frameRate(60);
  u1.starSetup();
  button1 = new Button(new PVector(width/2, height/2), new PVector(width/2, height/8), 64, 1);
  button1.buttonSetup();
  button2 = new Button(new PVector(width/2, height/2 - height / 6), new PVector(width/2, height/8), 64, 1);
  button2.buttonSetup();
  button3 = new Button(new PVector(width/2, height/2 + height / 6), new PVector(width/2, height/8), 64, 1);
  button3.buttonSetup();
  
//noCursor();

//PLAYERS
  player1 = new Player(new PVector(width / 2, height - height / 8), 0.5f, 3);
  player1.setSprite("Player.PNG");

//ENEMIES
  for(int i = 0 ; i<8 ; i++){
    Enemy t = new Enemy(new PVector(i*160+80, -height / 8), 0.5f, 10  );
    t.setSprite("Player.PNG");
    enemies.add(t);
    //enemy[i]= new Enemy(new PVector(i*160+80, -height / 8), 0.5f);
    //enemy[i].setSprite("Player.PNG");
  }
  
//BULLETS
  bullets = new ArrayList();
}


public void pre() // used to update positions and other atributes
{
  scene1("PRE");
}

public void draw()// used to display
{
  println((int)frameRate);
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
    if(button2.clicked()){scene=1;}
    button3.display();
    if(button3.clicked()){exit();}
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
  
//BULLETS
  for(int i = 0; bullets.size() != 0 && i < bullets.size(); i++) {
    bullets.get(i).move();
    for(int j = 0; enemies.size() != 0 && j < enemies.size(); j++){
      if(bullets.get(i).hitdetection( enemies.get(j).getOrigin(), enemies.get(j).getSize())){
        if(enemies.size() != 0){enemies.remove(enemies.get(j)); score++;}
      }
    }
  if(bullets.size() != 0){ if(bullets.get(i).getOrigin().y < 0){bullets.remove(bullets.get(i));}}
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
  //if(darkmode){//filter(INVERT);
  //}
  }
}

public void keyPressed() {
if(key == 'a'){ aPressed = true;}
if(key == 'd'){ dPressed = true;}
if(key == ' '){ spacePressed = true;}
}

public void keyReleased() {
if(key == 'a'){ aPressed = false;}
if(key == 'd'){ dPressed = false;}
if(key == ' '){ spacePressed = false;}
}

public void mouseReleased() {
  button1.mouseP = true;
  button2.mouseP = true;
  button3.mouseP = true;
}

private void controlls(){
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
