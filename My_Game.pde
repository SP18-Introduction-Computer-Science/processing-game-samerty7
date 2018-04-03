Snake s;
int scl = 20;

PVector food;

void setup() {
  size(600, 600);
  s = new Snake();
  frameRate(10);
  pickLocation();
}

void pickLocation() {
  int cols = width/scl;
  int rows = height/scl;
  food = new PVector(floor(random(cols)), floor(random(rows)));//Randomly places "food" at various points through the map. 
  food.mult(scl);
}

void mousePressed() {
  s.total++;
}

void draw() {
  background(51);

  if (s.eat(food)) {
    pickLocation();
  }
  s.death();
  s.update();
  s.show();


  fill(255, 0, 100);
  rect(food.x, food.y, scl, scl);
}





void keyPressed() {
  if (key == 'w') {
    s.dir(0, -1);
  } else if (key == 's') {
    s.dir(0, 1);
  } else if (key == 'd') {
    s.dir(1, 0);
  } else if (key == 'a') {
    s.dir(-1, 0);
  }
}