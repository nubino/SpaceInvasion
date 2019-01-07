public class UI
{
  PVector [] point = new PVector[512];
  
  void starSetup()
  {
    for(int i = 0 ; i < point.length ; i++)
    {
      point[i] = new PVector(random(0, width), random(0, height));
    }
  }
  
  void stars()
  {
    for(int i = 0 ; i < point.length ; i++)
    {
      point(point[i].x, point[i].y);
    }
  }
}
