//Actors are all moving things that can be hit, like the player or enemies
public class Actor
{
  private PVector origin;
  private PVector position;
  private float   speed;
  private float   scale;
  private PImage  spriteP;
  private int     hp;
  
  //
  //conversion methodes
  
  public PVector originToPosition()
  {
    return new PVector(origin.x - spriteP.width*scale/2, origin.y - spriteP.height*scale/2);
  }
  
  public PVector positionToOrigin()
  {
    return new PVector(position.x + spriteP.width*scale/2, position.y + spriteP.height*scale/2);
  }
  
  //
  //start getter / setter methodes
  
  public void setSprite(String spriteP)
  {
    this.spriteP = loadImage(spriteP);
  }
  
  public PImage getSprite()
  {
    return spriteP;
  }
  
    public PVector getPosition()
  {
    return position;
  }
  
  public void setPosition(PVector position)
  {
    this.position = position;
  }
  
  public PVector getOrigin()
  {
    return origin;
  }
  
  public void setOrigin(PVector origin)
  {
    this.origin = origin;
  }
  
  public PVector getSize()
  {
    return new PVector(spriteP.width*scale, spriteP.height*scale);
  }
  
  public void setScale(float scale)
  {
    this.scale = scale;
  }
  
  public float getScale()
  {
    return scale;
  }
  
  public void setSpeed(float speed)
  {
    this.speed = speed;
  }
  
  public float getSpeed()
  {
    return speed;
  }
  //end getter / setter methodes
  //
  
}

//██████╗ ██╗      █████╗ ██╗   ██╗███████╗██████╗ 
//██╔══██╗██║     ██╔══██╗╚██╗ ██╔╝██╔════╝██╔══██╗
//██████╔╝██║     ███████║ ╚████╔╝ █████╗  ██████╔╝
//██╔═══╝ ██║     ██╔══██║  ╚██╔╝  ██╔══╝  ██╔══██╗
//██║     ███████╗██║  ██║   ██║   ███████╗██║  ██║
//╚═╝     ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝

public class Player extends Actor{

  Player(PVector origin, float scale, float speed)
  {
    //print(origin);
    setOrigin(origin);
    setScale(scale);
    setSpeed(speed);
  }
  public void move(String direction)
  {
    if(direction == "LEFT"){getOrigin().x -= getSpeed(); setOrigin(new PVector(getOrigin().x, getOrigin().y));}
    if(direction == "RIGHT"){getOrigin().x += getSpeed(); setOrigin(new PVector(getOrigin().x, getOrigin().y));}

    if(this.getOrigin().x > width){this.setOrigin(new PVector(width, getOrigin().y));}
    if(this.getOrigin().x < 0){this.setOrigin(new PVector(0, getOrigin().y));}
  }
  public void display()
  {
    setPosition(originToPosition());
    image(getSprite(), getPosition().x, getPosition().y, getSize().x, getSize().y);
  } 
}

//███████╗███╗   ██╗███████╗███╗   ███╗██╗   ██╗
//██╔════╝████╗  ██║██╔════╝████╗ ████║╚██╗ ██╔╝
//█████╗  ██╔██╗ ██║█████╗  ██╔████╔██║ ╚████╔╝ 
//██╔══╝  ██║╚██╗██║██╔══╝  ██║╚██╔╝██║  ╚██╔╝  
//███████╗██║ ╚████║███████╗██║ ╚═╝ ██║   ██║   
//╚══════╝╚═╝  ╚═══╝╚══════╝╚═╝     ╚═╝   ╚═╝   

public class Enemy extends Actor{
 
  float radiant = 0;
  float posY;
  float posX;
  float r = 1;//radius
  double Ankat;
  float Ankathete;
  int speed;
  
  Enemy(PVector origin, float scale, int speed)
  {
    setOrigin(origin);
    setScale(scale);
    this.speed = speed;
  }
  
    public void display()
  {
    posX = getOrigin().x;
    posY = getOrigin().y;
    Ankat = Math.cos(radiant);
    radiant += 0.01f;
    Ankathete = (float)Ankat;
    posX = posX + Ankathete * r;
    posY = posY + 0.75f;
    setOrigin(new PVector(posX,posY));
    
    setPosition(originToPosition());
    image(getSprite(), getPosition().x, getPosition().y, getSize().x, getSize().y);
  }
}
