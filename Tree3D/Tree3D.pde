Stick stick;
  float p = 0;
  boolean compute = true;
  ArrayList<MapPVector> pVectorMap = new ArrayList<MapPVector>();

  public void setup() {
    size(800, 800, OPENGL);
    initStick();
  }

  public void draw() {
    computeStickPosition();
    displaySticks();
  }

  private void displaySticks() {
    background(0);
    noStroke();
    pointLight(51, 102, 126, 35, 40, 36);
    translate(width / 2, height, -200);
    rotateY(radians(p++));
    for (int i = 0; i < pVectorMap.size(); i++){
       for (int j = 0; j < pVectorMap.get(i).pVectorWidths.size(); j++) {
        pushMatrix();
        drawCylinder(pVectorMap.get(i).pVectorWidths.get(j));
        popMatrix();
      }
    }
  }

  private void computeStickPosition() {
   if (compute) {
      ArrayList<PVectorWidth> buleListComputed = stick.display();
      for (int i = 0; i < buleListComputed.size(); i++) {
        PVectorWidth current =  (PVectorWidth) buleListComputed.get(i);
        ArrayList<PVectorWidth> listbule = new ArrayList<PVectorWidth>();
        for (int j = 0; j < pVectorMap.size(); j++) {
          if(pVectorMap.get(j).id == current.getId()){
            listbule = pVectorMap.get(j).pVectorWidths;
          }
        }
        
        if (listbule.size() <=0) {
          listbule = new ArrayList<PVectorWidth>();
          listbule.add(current);
          pVectorMap.add(new MapPVector(current.getId(), listbule));
        } else {
          PVectorWidth lastVector = (PVectorWidth)listbule.get(listbule.size()-1);
          PVector last = new PVector(lastVector.x,lastVector.y,lastVector.z);
          PVector niou = new PVector(current.x,current.y,current.z);
          if (abs(last.dist(niou)) >= current.getWid()) {
             
            listbule.add((PVectorWidth) current);
          }
        }
      }
    }
  }

  public void mousePressed() {
    initStick();
  }

  void drawCylinder(final PVectorWidth current) {
    float r1 = current.getWid()*3;
    translate(current.x*3, current.y*3, current.z*3);
    box(r1);
  }

  private void initStick() {
    compute = true;
    pVectorMap =  new ArrayList<MapPVector>();
    stick = new Stick( new PVector(0, 0), 50, 80);
    background(0);
  }

