class CircleDirection {
  Circle c;
  float direction; //angle
  CircleDirection(Circle cc, float d) {
    c= cc;
    direction = d;
  }
  float GetAngle() {
    return direction;
  }
}
