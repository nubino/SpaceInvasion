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
}

  
public class Button
{
  PVector origin;
  PVector size;
  PVector [] point;      //point array
  PVector [] velocity;   //speed of the points
  PVector tL = new PVector(); //top left corner
  PVector bR = new PVector(); //bottom right corner
  float speed;
  int thickness = 2;
  String text;
  public Boolean mouseP = false;
  
  public Button(PVector origin, PVector size, int pointCount, float speed, String text)
  {
    this.origin = origin;
    this.size = size;
    this.speed = speed;
    this.text = text;
    point = new PVector[pointCount];
    velocity = new PVector[pointCount];
    
    tL.x = origin.x - size.x/2;  
    tL.y = origin.y - size.y/2;
    bR.x = origin.x + size.x/2;
    bR.y = origin.y + size.y/2;
    }
  
  void buttonSetup()
  {
    for(int i = 0 ; i < point.length ; i++)
    {
      point[i] = new PVector(random(tL.x, bR.x), random(tL.y, bR.y));
      velocity[i] = new PVector(random(-speed, speed), random(-speed, speed));
    }
  }
  
  public void display()
  {
  
  for(int i = 0 ; i < point.length ; i++)
    {
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
  strokeWeight(thickness);
  fill(0,0,0,0);
  rect(tL.x ,tL.y, size.x, size.y);
  textFont(font1);
  textSize(40);
  fill(0);
  textAlign(CENTER, CENTER);
  text(text, tL.x, tL.y, size.x, size.y); 
  strokeWeight(thickness);
  }
  
  public boolean clicked()
  {
  
  if(mouseX > tL.x && mouseY > tL.y && mouseX < bR.x && mouseY < bR.y){ thickness = 4; if(mouseP == true){ mouseP = false; return true;}}
  else{ thickness = 2;}
  
  mouseP = false;
  return false;
  }
 
}


  
public class Logo
{
  PVector origin;
  PVector tL = new PVector(); //top left corner
  PVector bR = new PVector(); //bottom right corner

  
  public Logo(PVector origin)
  {
    this.origin = origin;
    
    tL.x = origin.x - logo.width/2;  
    tL.y = origin.y - logo.height/2;
    
  }
  
  public void display()
  {
    image(logo, tL.x, tL.y);
  }
}
