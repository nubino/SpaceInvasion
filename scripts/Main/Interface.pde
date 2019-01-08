public class UI
{
 
  PVector [] star = new PVector[512];
  
  void starSetup()
  {
    for(int i = 0 ; i < star.length ; i++)
    {
      star[i] = new PVector(random(0, width), random(0, height));
    }
  }
  
  void stars()
  {
    for(int i = 0 ; i < star.length ; i++)
    {
      point(star[i].x, star[i].y);
    }
  }
  
  void buttonSetup()
  {
    for(int i = 0 ; i < point.length ; i++)
    {
      point[i] = new PVector(random(width/2 - width / 4, width/2 + width / 4), random(height/2 - height / 16, height/2 + height / 16));
      velocity[i] = new PVector(random(-speed, speed), random(-speed, speed));
    }
  }
  
  boolean button(PVector origin)
{
  
  PVector tL = new PVector();
  PVector bR = new PVector();
  
  tL.x = origin.x - width / 4;
  tL.y = origin.y - height / 16;
  bR.x = origin.x + width / 4;
  bR.y = origin.y + height / 16;
  
  
  for(int i = 0 ; i < point.length ; i++)
    {
      surface.setSize((int)resolution.x, (int)resolution.y);
      point[i].add(velocity[i]);
      
      if(point[i].x <= tL.x){ point[i].x = tL.x + 1; velocity[i].x *= -1; }
      if(point[i].y <= tL.y){ point[i].y = tL.y + 1; velocity[i].y *= -1; }
      if(point[i].x >= bR.x){ point[i].x = bR.x - 1; velocity[i].x *= -1; }
      if(point[i].y >= bR.y){ point[i].y = bR.y - 1; velocity[i].y *= -1; }
      
      for(int j = 0 ; j < (point.length -1) ; j++)
      {
        if(PVector.dist(point[i],point[j]) < width/40 && PVector.dist(point[i], new PVector(mouseX, mouseY)) <= width / (5) && PVector.dist(point[i], new PVector(mouseX, mouseY)) <= width / (6))
        {
        stroke(200);
        line(point[i].x, point[i].y,point[j].x, point[j].y);
        }
        if(PVector.dist(point[i],point[j]) < width/40 && PVector.dist(point[i], new PVector(mouseX, mouseY)) <= width / (6) && PVector.dist(point[i], new PVector(mouseX, mouseY)) >= width / (8) )
        {
        stroke(120);
        line(point[i].x, point[i].y,point[j].x, point[j].y);
        }
        if(PVector.dist(point[i],point[j]) < width/40 && PVector.dist(point[i], new PVector(mouseX, mouseY)) <= width / (8) && PVector.dist(point[i], new PVector(mouseX, mouseY)) <= width / (16))
        {
        stroke(50);
        line(point[i].x, point[i].y,point[j].x, point[j].y);
        }
        if(PVector.dist(point[i],point[j]) < width/40 && PVector.dist(point[i], new PVector(mouseX, mouseY)) <= width / (16) )
        {
        stroke(0);
        line(point[i].x, point[i].y,point[j].x, point[j].y);
        }
        stroke(0);
      }
      point(point[i].x, point[i].y);
    }
  
     
  strokeWeight(size);
  fill(0,0,0,0);
  rect(tL.x ,tL.y, width / 2, height / 8);
  strokeWeight(1);
  
  if(mouseX > tL.x && mouseY > tL.y && mouseX < width/2 + bR.x && mouseY < bR.y){ size = 4; if(mouseP == true){ mouseP = false; return true;}}
  else{ size = 2;}
   
  //image(spriteP, float(width / 2 - spriteP.width / 2), float( height / 6 - spriteP.height / 2));
  mouseP = false;
  return false;
}
  
}

private Boolean mouseP = false;
PVector [] point = new PVector[64];
PVector [] velocity = new PVector[64];
float speed = .3;
int size = 4;
PVector resolution = new PVector(1280, 720);
private PImage spriteP;

void mouseReleased() {
  mouseP = true;
}

//void setup()
//{
  
//  size(1280, 720);
//  surface.setResizable(true);
//  for(int i = 0 ; i < point.length ; i++)
//    {
//      point[i] = new PVector(random(width/2 - width / 4, width/2 + width / 4), random(height/2 - height / 16, height/2 + height / 16));
//      velocity[i] = new PVector(random(-speed, speed), random(-speed, speed));
//    }
//    spriteP = loadImage("Logo.png");
//}
