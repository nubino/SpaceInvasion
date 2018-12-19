public class Weapon{
  private PVector position;
  private int damage;
  private int range;
  private int attackspeed;
  
  //
  //start getter / setter methodes
  
  public PVector getPosition()
  {
    return position;
  }
  
  public void setPosition(PVector position)
  {
    this.position = position;
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
  private PImage sprite;
  private Boolean setActive = false;
  
  Bullet(String sprite,PVector position, PVector velocity, int damage, Boolean setActive)
  {
    setActive = setActive;
    loadImage(sprite);
    this.velocity = velocity;
    setPosition(position);
    setDamage(damage);
  }
  
  void draw(){
    setPosition(PVector.add(getPosition(), velocity));
    print("lul");
    image(sprite, getPosition().x, getPosition().y);
  }
}
