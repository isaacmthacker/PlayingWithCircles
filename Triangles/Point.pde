class Point {
  float x, y;
  Point(float xx, float yy) {
    x = xx; 
    y = yy;
  }
  void display() {
    ellipse(x, y, 5, 5);
  }
};
