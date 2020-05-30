class Triangle {
  Point p1, p2, p3;
  Triangle(Point pp1, Point pp2, Point pp3) {
    p1 = pp1;
    p2 = pp2;
    p3 = pp3;
  }
  void display() {
    line(p1.x, p1.y, p2.x, p2.y);
    line(p2.x, p2.y, p3.x, p3.y);
    line(p3.x, p3.y, p1.x, p1.y);
  }
};
