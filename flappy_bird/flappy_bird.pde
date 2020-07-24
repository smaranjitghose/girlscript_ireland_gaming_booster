Bird b;
int wid = 400;
int rez = 20;
int score = 0;
boolean jumping = false;
PVector gravity = new PVector(0, 0.5);
ArrayList<Pipe> pipes = new ArrayList<Pipe>();
PImage mountain; // Declare an image object for the background

// This function runs only once
void setup() {
  size(400, 800); // Create a canvas of width 400 pixels and height 800 pixels 
  b = new Bird(); // Intializing our bird object
  pipes.add(new Pipe());
  mountain = loadImage("/assets/background.jpg"); // Fetch the mountain image using the relative path
}
// This function runs multiple times
void draw() {
  background(0, 0, 0); // Setting the default background color to black
  image(mountain,0,0); // Now we put our background image
  if (frameCount % 75 == 0) {
    pipes.add(new Pipe());
  }

  if (keyPressed) {
    PVector up = new PVector(0, -5);
    b.applyForce(up);
  }

  b.update();
  b.show();
  boolean safe = true;

  for (int i = pipes.size() - 1; i >= 0; i--) {
    Pipe p = pipes.get(i);
    p.update();

    if (p.hits(b)) {
      p.show(true);
      safe = false;
    } else {
      p.show(false);
    }

    if (p.x < -p.w) {
      pipes.remove(i);
    }
  }

  if (safe) {
    score++;
  } else {
    score -= 50;
  }

  fill(255, 0, 255);
  textSize(64);
  text(score, width/2, 50);
  score = constrain(score, 0, score);
}
