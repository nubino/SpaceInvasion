//Actors are all moving things that can be hit, like the player or enemies
public class Actor
{
  private PVector origin;
  private PVector position;
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

  Player(PVector origin, float scale)
  {
    print(origin);
    setOrigin(origin);
    setScale(scale);
  }
  
  public void display()
  {
    setPosition(originToPosition());
    image(getSprite(), getPosition().x, getPosition().y, getSize().x, getSize().y);
  }
  
  public void controll()
  {
    float posX = getOrigin().x ;
    
  //Mouse controls
    //setOrigin(new PVector(mouseX, getOrigin().y));
    
  //Keyboard controls
    if (keyPressed == true){
      if(key == 'd' ||key == 'a'){
          if (key == 'd'){
          posX=posX+3;
          setOrigin(new PVector(posX,getOrigin().y));
        }else if(key == 'a'){
          posX=posX-3;
          setOrigin(new PVector(posX,getOrigin().y));
        }
    //    Bullet temp = new Bullet("Bullet.PNG", getPosition(), new PVector(0,-10), 20);
    //    bullets.add(temp);
      }
    }
  }
}

//███████╗███╗   ██╗███████╗███╗   ███╗██╗   ██╗
//██╔════╝████╗  ██║██╔════╝████╗ ████║╚██╗ ██╔╝
//█████╗  ██╔██╗ ██║█████╗  ██╔████╔██║ ╚████╔╝ 
//██╔══╝  ██║╚██╗██║██╔══╝  ██║╚██╔╝██║  ╚██╔╝  
//███████╗██║ ╚████║███████╗██║ ╚═╝ ██║   ██║   
//╚══════╝╚═╝  ╚═══╝╚══════╝╚═╝     ╚═╝   ╚═╝   

public class Enemy extends Actor{
  
  Enemy(PVector origin, float scale )
  {
    print(origin);
    setOrigin(origin);
    setScale(scale);
  }
  
    public void display()//??
  {
    float posY = getOrigin().y;
    float posX = getOrigin().x;
    float radiant = cRadiant;//??
    float r = 1.5;//radius
    
    double Ankat = Math.cos(radiant);
    float Ankathete =(float) Ankat;
    //print(radiant);
    posX = posX + Ankathete * r;
    posY = posY + 0.25;
    setOrigin(new PVector(posX,posY));
    
    setPosition(originToPosition());
    image(getSprite(), getPosition().x, getPosition().y, getSize().x, getSize().y);

  }
}
