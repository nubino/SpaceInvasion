// Main class used to launch the application

PImage player;

void setup()
{
  player = loadImage("Player.PNG");
  size(1280, 720);
}

void draw()
{
  test();
}

void test()
{
  background(#ffffff);
  image(player, width / 2 - player.width/2, height - height / 8 - player.height/2);
}
