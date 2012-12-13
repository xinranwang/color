//#009999
//#FF7400
float rotX = 0;
float rotY = 0;
float side;

void setup() {
  size(500, 500, P3D);
  noStroke();
  rectMode(CENTER);
  colorMode(HSB, 360, 100, 100);
  side = width;
}

void draw() {
  float S = map(mouseX, 0, width, 0, 100);
  float B = map(mouseY, 0, height, 0, 100);
  float aH = rotY / TWO_PI * 360;
  if(aH < 0) aH += 360;
  aH = aH % 360;
  float bH = (aH + 240) % 360;
  //side *= (1+rotY/100);
  
  color a = color(aH, S, B);
  color b = color(bH, S, B);

  background(b);
  translate(width / 2, height / 2);
  rotateZ(rotY);
  //rotateY(rotY);
  for (int i = 0; i < 15; i++) {
    if (i % 2 == 0) fill(a);
    else fill(b);
    pushMatrix();
    //rotateZ(i * HALF_PI);
    float eachSide = side;
    for (int j = 0; j < i; j++) {
      eachSide *= 0.707;
      rotateZ(HALF_PI / 2);
    }
    rect(0, 0, eachSide, eachSide);
    popMatrix();
  }
}

void mouseDragged() {
  float rate = 0.005;
  rotX += (pmouseY - mouseY) * rate;
  rotY += (mouseX - pmouseX) * rate;
}

void keyPressed() {
  saveFrame("color-####.png");
  println("Image Saved");
}
