//Triangle CreateTriangle(float x, float y, float xr, float yr) {
//  float step = 2*PI/3.0;
//  return new Triangle(GetPoint(x, y, xr, yr, 0), GetPoint(x, y, xr, yr, step), GetPoint(x, y, xr, yr, 2*step));
//}

float f(float x, Point mb) {
  float m = mb.x;
  float b = mb.y;
  return m*x+b;
}

void Line(Point mb) {
  float x1 = -width;
  float x2 = width;
  line(x1, f(x1, mb), x2, f(x2, mb));
}

Point GetPoint(float x, float y, float xr, float yr, float angle) {
  return new Point(xr/2.0*cos(angle)+x, yr/2.0*sin(angle)+y);
}

float IntersectX(Point mb1, Point mb2) {
  float m1 = mb1.x;
  float b1 = mb1.y;
  float m2 = mb2.x;
  float b2 = mb2.y;
  return (b2-b1)/(m1-m2);
}

ArrayList<Circle> GetRandomCircles(Circle center, int levels) {
  float radiusFactor = 9.0/10.0;
  ArrayList<Circle> ret = new ArrayList<Circle>();
  //ArrayList<Circle> workingList = new ArrayList<Circle>();
  ArrayList<CircleDirection> workingList = new ArrayList<CircleDirection>();
  float angle = 0;
  int numStartingCircles = 4;
  float angelStep = 2*PI/numStartingCircles;
  for (int i = 0; i < numStartingCircles; ++i) {
    workingList.add(new CircleDirection(center.GetTouchingCircle(radiusFactor*center.r, angle), angle));
    angle += angelStep;
  }
  ret.add(center);
  while (!workingList.isEmpty()) {
    CircleDirection curD = workingList.get(0);
    Circle cur = curD.c;

    //workingList.add(cur.GetTouchingCircle(9.0*cur.r/10.0, PI));
    float newAngle = curD.GetAngle()+random(-PI/6, PI/6);
    workingList.add(new CircleDirection(cur.GetTouchingCircle(radiusFactor*cur.r, newAngle), newAngle));
    ret.add(cur);

    workingList.remove(0);

    if (ret.size() >= levels) {
      break;
    }
  }

  return ret;
}

Triangle t, t2;
float s = 250;
float x, y, xr, yr;
float curAngle = 0.0;
int numPoints = 64;
float angleStep = 2*PI/1024;
float rmin = 250;
float rmax = 250;

ArrayList<Float> angles;
ArrayList<Circle> circles;


float angle = -7*PI/6.0;
float curStep = 2*PI/120.0;

int tick = 0;
float trigger = 60/4; //assuming frameRate of 60fps



void setup() {
  size(650, 650);

  x = width/2.0;
  y = height/2.0;
  fill(255);
  println(frameRate);

  //circles = new ArrayList<Circle>();
  //float r1 = 100;
  //Point p = new Point(width/2.0, height/2.0);
  //Circle c1 = new Circle(p, r1);
  ////float angle = -7*PI/6.0;
  //float r2 = 50;
  //float x1val = r1*cos(angle)+p.x;
  //float y1val = r1*sin(angle)+p.y;

  //float x2val = r2*cos(PI+angle);//+x2
  //float y2val = r2*sin(PI+angle);//+y2
  ////have to add xs otherwise get original x
  //Circle c2 = new Circle(new Point(x1val-x2val, y1val-y2val), r2);



  //circles.add(c1);
  //circles.add(c2);
  ////circles.add(new Circle(new Point(p.x-r1*cos(2*PI-angle), p.y-r1*sin(2*PI-angle)), 5));
  //circles.add(new Circle(new Point(r1*cos(angle)+p.x, r1*sin(angle)+p.y), 5));
  //fill(color(255, 0, 0));

  Circle start = new Circle(width/2.0, height/2.0, 25);

  circles = GetRandomCircles(start, 100);
}



void draw() {
  background(0);
  for (Circle c : circles) {
    c.display();
  }

  ellipse(x, y, 5, 5);



  //float x1val = r1*cos(angle)+width/2.0;
  //float y1val = r1*sin(angle)+height/2.0;

  //float x2val = r2*cos(PI+angle);//+x2
  //float y2val = r2*sin(PI+angle);//+y2
  //Circle c2 = new Circle(new Point(x1val-x2val, y1val-y2val), r2);

  //Circle c2 = GetTouchingCircle(new Point(width/2.0, height/2.0), r1, r2, angle);
  //c2.display();
  //Circle c3 = GetTouchingCircle(c2.p, c2.r, 25, angle);
  //c3.display();
  //Circle c4 = GetTouchingCircle(c3.p, c3.r, 12.5, angle);
  //c4.display();
  //Circle c5 = GetTouchingCircle(c4.p, c4.r, 6.25, angle);
  //c5.display();
  //Circle c6 = GetTouchingCircle(c5.p, c5.r, 3.125, angle);
  //c6.display();


  //angle += curStep;
  tick += 1;

  if (tick >= trigger) {
    circles.clear();
    Circle start = new Circle(width/2.0, height/2.0, 25);
    circles = GetRandomCircles(start, 100);
    tick = 0;
  }
}

void keyPressed() {
  println(keyCode);
  circles.clear();
  Circle start = new Circle(width/2.0, height/2.0, 25);
  circles = GetRandomCircles(start, 100);
}
