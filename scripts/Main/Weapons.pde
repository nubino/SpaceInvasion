public class Weapon{
  
  private PVector origin;
  private PVector position;
  private float   scale;
  protected PImage  spriteP;
  private int damage;
  private int range;
  private int attackspeed;
  
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
    return spriteP  ;
  }
  
  public void setScale(float scale)
  {
    this.scale = scale;
  }
  
  public float getScale()
  {
    return scale;
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
  
  public int getDamage()
  {
    return damage;
  }
  
  public void setDamage(int damage)
  {
    this.damage = damage;
  }
  
  public int getRange()
  {
    return range;
  }
  
  public void setRange(int range)
  {
    this.range = range;
  }
  
  public int getAttackspeed()
  {
    return attackspeed;
  }
  
  public void setAttackspeed(int attackspeed)
  {
    this.attackspeed = attackspeed;
  }
}

//██████╗ ██╗   ██╗██╗     ██╗     ███████╗████████╗
//██╔══██╗██║   ██║██║     ██║     ██╔════╝╚══██╔══╝
//██████╔╝██║   ██║██║     ██║     █████╗     ██║   
//██╔══██╗██║   ██║██║     ██║     ██╔══╝     ██║   
//██████╔╝╚██████╔╝███████╗███████╗███████╗   ██║   
//╚═════╝  ╚═════╝ ╚══════╝╚══════╝╚══════╝   ╚═╝   

//TODO GET IT TO DO STH

public class Bullet extends Weapon{

  private PVector velocity;
  
  Bullet(PVector origin, String sprite, float scale, PVector velocity, int damage)
  {
    setOrigin(origin);
    setSprite(sprite);
    setScale(scale);
    setDamage(damage);
    this.velocity = velocity;  
  }
  
  void move(){
    setOrigin(PVector.add(getOrigin(), velocity));
  }
  
  void display(){
    setPosition(originToPosition());
    image(getSprite(), getPosition().x, getPosition().y, getSize().x, getSize().y);
  }
  
   boolean hitdetection(PVector Enemy, PVector size){
     
     PVector origin2 = Enemy;
     PVector radius = size;
   
     float dist = getOrigin().dist(origin2);
     if(dist < this.spriteP.width + radius.x/2){
       return true;
     }else
     return false;
   }
}

//██████╗  ██████╗  ██████╗██╗  ██╗███████╗████████╗
//██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
//██████╔╝██║   ██║██║     █████╔╝ █████╗     ██║   
//██╔══██╗██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
//██║  ██║╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
//╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   

public class Rocket extends Weapon{
  private int x = 0; 
  private PVector velocity = new PVector(0, 0);
  
  Rocket(PVector origin, String sprite, float scale, int damage){
    
    setOrigin(origin);
    setSprite(sprite);
    setScale(scale);
    setDamage(damage);
  }
  
  void move(){
    x++;
    velocity.y = 0.0625*(-(x)^2);
    
    setOrigin(PVector.add(getOrigin(), velocity));
  }
  
  void display(){
    setPosition(originToPosition());
    image(getSprite(), getPosition().x, getPosition().y, getSize().x, getSize().y);
  }
  
  // boolean hitdetection(PVector Enemy, PVector size){
     
  //   PVector eOrigin = Enemy;
  //   PVector radius = size;
   
  //   float dist = getOrigin().dist(eOrigin);
  //   if(dist < this.spriteP.width + radius.x/2){
  //     return true;
  //   }else
  //   return false;  
  //}
}

//██╗      █████╗ ███████╗███████╗██████╗ 
//██║     ██╔══██╗██╔════╝██╔════╝██╔══██╗
//██║     ███████║███████╗█████╗  ██████╔╝
//██║     ██╔══██║╚════██║██╔══╝  ██╔══██╗
//███████╗██║  ██║███████║███████╗██║  ██║
//╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝

public class Laser extends Weapon{

  Laser(PVector origin, String sprite, float scale, int damage){
  
    setOrigin(new PVector (player1.getOrigin().x, height/2-player1.getSize().y));
    setSprite(sprite);
    setScale(scale);
    setDamage(damage);
  }
  
  void display(float playerX){
    setOrigin(new PVector(playerX, getOrigin().y));
    setPosition(originToPosition());
    image(getSprite(), getPosition().x, getPosition().y, getSize().x, getSize().y);
  }
  
  //boolean hitdetection(PVector Enemy, PVector size){
     
  // PVector eOrigin = Enemy;
  // PVector radius = size;
   
  // float dist = getOrigin().dist(eOrigin);
  // if(dist < this.spriteP.width + radius.x/2){
  //   return true;
  // }else
  // return false;  
  //}
}
