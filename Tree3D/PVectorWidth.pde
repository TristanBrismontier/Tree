class PVectorWidth extends PVector {
  float wid;
  float grey;
  float alpha;
  float id;

  public PVectorWidth(final PVector vector, final float wid,final float grey,final float alpha, float id) {
    super(vector.x,vector.y,vector.z);
    this.wid = wid;
    this.grey = grey;
    this.alpha = alpha;
    this.id = id;
  }
  


  public float getGrey() {
    return grey;
  }

  public float getAlpha() {
    return alpha;
  }

  public float getWid(){
    return wid;
  }
  
}
