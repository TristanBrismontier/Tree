class EntityT {

  PVector location;
  float width;
  float height;
  final float id;

  public EntityT(PVector location, float width, float height,final float id) {
    this.id = id;
    this.location = location.get();
    this.width = width;
    this.height = height;
  }
}
