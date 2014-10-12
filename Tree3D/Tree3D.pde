Stick stick;
  float p = 0;
  final int side = 800;
  boolean compute = true;
  ArrayList<MapPVector> pVectorMap = new ArrayList<MapPVector>();

  public void setup() {
    size(side, side, P3D);
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
        List<PVectorWidth> listbule = pVectorMap.get(pVectorWidth.getId());
        if (listbule == null) {
          listbule = new ArrayList<PVectorWidth>();
          listbule.add(buleListComputed.get(i);
          pVectorMap.put(pVectorWidth.getId(), listbule);
        } else {
          PVectorWidth lastVector = Iterables.getLast(listbule);
          if (abs(lastVector.dist(pVectorWidth)) >= pVectorWidth
              .getWid()) {
            listbule.add(pVectorWidth);
          }
        }
      }
    }
  }

  public void mousePressed() {
    initStick();
  }

  void drawCylinder(final PVectorWidth current) {
    float r1 = current.getWid();
    translate(current.x, current.y, current.z);
    box(r1);
  }

  private void initStick() {
    ;
    compute = true;
    pVectorMap = new HashMap<UUID, List<PVectorWidth>>();
    stick = new Stick(this, new PVector(0, 0), 50, 180);
    background(255);
  }

