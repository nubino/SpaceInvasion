//used to change all parameters of the player

class Player{

  private PVector origin;
  private PVector position;
  
  private float scale;
  
  private PImage spriteP;
  
  Player(PVector origin, float scale)
  {
    print(origin);
    this.origin = origin;
    this.scale = scale;
  }
  
  public void display()
  {
    position = originToPosition();
    image(spriteP, position.x, position.y);
    //rect(position.x, position.y,100,100);
  }
  
  //
  //local conversion methodes
  
  private PVector originToPosition()
  {
    
    return new PVector(origin.x - spriteP.width/2, origin.y - spriteP.height/2);
  }
  
  private PVector positionToOrigin()
  {
    return new PVector(position.x + spriteP.width/2, position.y + spriteP.height/2);
  }
  
  //
  //start getter / setter methodes
  
  public void setSprite(String spriteP)
  {
    this.spriteP = loadImage(spriteP);
  }
  
  public void setOrigin(PVector origin)
  {
    this.origin = origin;
  }
  
  public void setScale(float scale)
  {
    this.scale = scale;
  }
  
  public PVector getOrigin()
  {
    return origin;
  }
  
  public float getScale()
  {
    return scale;
  }
  
  //end getter / setter methodes
  //
  
}
