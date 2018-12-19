// Main class used to launch the application

Player player1;

void setup()
{
  size(1280, 720);
  frameRate(144);
  noCursor();
  player1 = new Player(new PVector(width / 2, height - height / 8), 0.5f);
  player1.setSprite("Player.PNG");
}

void draw()
{
  background(#ffffff);
  player1.display();
  player1.controll();
  
  filter(INVERT);
}
