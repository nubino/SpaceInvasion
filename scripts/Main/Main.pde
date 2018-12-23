// Main class used to launch the application

Player player1;
ArrayList <Bullet> bullets;

void setup()
{
  size(1280, 720);
  frameRate(144);
  noCursor();
  bullets = new ArrayList();
  player1 = new Player(new PVector(width / 2, height - height / 8), 0.5f);
  player1.setSprite("Player.PNG");
}

void draw()
{
  background(#ffffff);
  player1.display();
  player1.controll();
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
