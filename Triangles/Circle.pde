class Circle {
  float x, y, r;
  ArrayList<Circle> immediate;
  Circle(float xx, float yy, float rr) {
    x = xx;
    y = yy;
    r = rr;
    immediate = new ArrayList<Circle>();
  }
  void display() {
    ellipse(x, y, 2*r, 2*r);
  }
  Point Tangent(float r, float x, float y, float centerx, float angle) {
    boolean pos = (PI >= angle && angle >= 0);
    float m = CircleDer(r, x, centerx, pos);
    float b = y-(m*x);
    return new Point(m, b);
  }


  //y = sqrt(r^2 - (x-a)^2) + b
  //circle at (a,b) <- center
  float CircleDer(float r, float x, float centerx, boolean pos) {
    //x needs to be based 0 based
    //float m = -x/(sqrt(r*r-(x*x)));
    float num = (pos ? -1 : 1)*(x-centerx);
    float den = sqrt(r*r - (x-centerx)*(x-centerx));
    float m = num/den;
    return m;
  }
  //r = radius
  Point GetCirclePoint(float angle) {
    return new Point(r*cos(angle)+x, r*sin(angle)+y);
  }
  Circle GetTouchingCircle(float r2, float angle) {
    //derived from 
    //r1cos(angle)+x1 = r2cos(PI+angle)+x2
    //r1sin(angle)+y1 = r2sin(PI+angle)+y2
    //r1 = circle's radius
    //x1, y1 = circle's middle

    float x1val = r*cos(angle)+x;
    float y1val = r*sin(angle)+y;

    float x2val = r2*cos(PI+angle);
    float y2val = r2*sin(PI+angle);
    //have to add xs otherwise get original x
    Circle ret = new Circle(x1val-x2val, y1val-y2val, r2);

    return ret;
  }
}
