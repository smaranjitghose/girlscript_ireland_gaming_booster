class Bird
{
  //-----------------Data members of our Bird Class--------------
  PVector pos;
  PVector vel;
  PVector acc;
  float r = 16;
  //------------------Functions of our Bird Class-----------------
  // Constructor to Intialize our Bird object
  Bird() {
    pos = new PVector(50, height/2);
    vel = new PVector(0, 0); 
    acc = new PVector();
  }

  void applyForce(PVector force)
  {
    acc.add(force);
  }

  void update() 
  {
    applyForce(gravity);
    pos.add(vel);
    vel.add(acc);
    vel.limit(4);
    acc.mult(0);

    if (pos.y > height)
    {
      pos.y = height;
      vel.mult(0);
    }
  }

  void show() {
    stroke(0,0,0); // Color of the outline of our birds (Black)
    strokeWeight(2); // thickness of the outline 
    fill(224, 218, 34);
    ellipse(pos.x, pos.y, r*2, r*2);
  }
}
