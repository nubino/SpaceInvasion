// Main class used to launch the application


Player player1;

void setup()
{
  size(1280, 720);
  player1 = new Player(new PVector(width / 2, height - height / 2), 1f);
  player1.setSprite("Player.PNG");
}

void draw()
{
  background(#ffffff);
  player1.display();
}
