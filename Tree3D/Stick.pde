 class Stick extends EntityT {
  PVector velocity;
  ArrayList<Stick> sticks;
  boolean pStick;
  float vampireLife ;
  float life;

  public Stick(PVector location, float width, float life, PVector velocity){
    super(location, width, width, random(10000));
    sticks = new ArrayList<Stick>();
    this.life = life;  
    this.velocity = velocity.get();
    pStick = false;
  }

  public Stick(PVector location, int width, float life){
    super(location, width, width, random(10000));
    sticks = new ArrayList<Stick>();
    this.life = life;  
    this.velocity = new PVector(0,-0.3f,0);
    pStick = true;
    vampireLife = 100;
  }

  public ArrayList<PVectorWidth>  display(){
     ArrayList<PVectorWidth> buleList = new ArrayList<PVectorWidth>();
    if(life > 0){
       PVectorWidth self = new PVectorWidth(location, width *(life/255), 75-life, life, id);
      if(width *(life/255) >=1f){
        buleList.add(self);
      }
      computeNewData();
    }
     ArrayList<Stick> stickToRemove = new ArrayList<Stick>();
    for (Stick stick : sticks) {
      ArrayList<PVectorWidth> childList = stick.display();
      if(childList.isEmpty()){
        stickToRemove.add(stick);
      }else{
        buleList.addAll(childList);
      }
    }
    sticks.removeAll(stickToRemove);
    return buleList;
  }
  
  private void computeNewData() {
    location.add(velocity);    
    life -=random(0.11f,0.05f);
    if(pStick){
      computeParentStick();
    }else{
      computeChildStick();
    }
  }

  private void computeChildStick() {
    velocity.y -= random(-2,2)/500;
    velocity.x += random(-3.5f,3.5f) /100;
    velocity.z += random(-3.5f,3.5f) /100;
    constrain(velocity.x, -0.95f, 0.95f);
    constrain(velocity.z, -0.95f, 0.95f);
    constrain(velocity.y, -9f, -0.05f);
    if(random(115)> life && percent(1.5f)) addstick();
  }

  private void computeParentStick() {
    velocity.y -=  random(-1,2) /500;
    velocity.x +=  random(-2,2) /100;
    velocity.z +=  random(-2,2) /100;
    constrain(velocity.x, -0.95f, 0.95f);
    constrain(velocity.z, -0.95f, 0.95f);
    System.out.println(life);
    if(random(255)> life && percent(3.5f) || life<25 && percent(50f)) addstick();
  }
  
  private boolean percent( float chance){
    return  random(100) < chance;
  }

  private void addstick() {
    float ratiolife = (pStick)?0.65f:0.80f;
    float ratioWidth = (pStick)?0.75f:0.9f;
    //add map instead
    PVector newVelocity = new PVector(velocity.x+(random(-1,1)*0.3f), velocity.y+(random(-0.5f,3)*0.1f),velocity.z+(random(-1,1)*0.3f));
    sticks.add(new Stick(location, width*ratioWidth, life*ratiolife, newVelocity));
    vampireLife -= 1.2f;
    life =life *0.97f;
  }
 }

