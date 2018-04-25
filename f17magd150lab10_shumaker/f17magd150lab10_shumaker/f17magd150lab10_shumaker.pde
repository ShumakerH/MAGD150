//I converted some variables into PVectors so I could manage the program better.
//Meka built the lampshade.  I made the .png file that goes with it.
//I adjusted Daniel Shiffman's pyramid code as needed.
//http://learningprocessing.com/examples/chp14/example-14-04-pyramid
//.obj file was found at the below link.
//https://www.turbosquid.com/3d-models/free-c4d-mode-anatomy-body/623330

//lampshade variables
float scale, u, v, uOffset, vOffset;
PVector lampshadePos, lampshadeRot;
boolean showDiagnosticImages = true;
PImage texture, txtr;

//sphere variables
float r;
PVector spherePos;

//Skull Variables
PShape skull;
PVector skullRot;

//camera variables
float angle, camSpeed, 
  x, y, z, 
  lookAtX, lookAtY, lookAtZ, 
  upX, upY, upZ, 
  orthoScale, 
  viewDist, 
  extents = 250;
Boolean orthographic;
  
/*
//pyramid variables
PVector pyrPos, pyrRot;
*/

void setup(){
  surface.setResizable(true);
  pixelDensity(displayDensity());
  size(1000, 500 , P3D);
  background(50);
  noStroke();
  colorMode(RGB, 1, 1, 1);
  
  //lampshade variables
  lampshadePos = new PVector(width/2, height/2, -500);
  //x = width/2.0;
  //y = height/2.0;
  //z = -500;
  scale = min(width, height)/3.0;
  lampshadeRot = new PVector(0, 0);
  //xRot = 0;
  //yRot = 0;
  uOffset = 0;
  vOffset = 0;
  u = 1;
  v = 1;
  
  textureMode(NORMAL);
  textureWrap(REPEAT);
  texture = loadImage("lampShade.png");
  
  //sphere variables
  spherePos = new PVector(width * 0.75, height * 0.5, 0);
  r = 100;
  
  /*//pyramid variables
  pyrPos = new PVector(width * 0.25, height * 0.5, 0);
  pyrRot = new PVector(0, 0);
  */
  
  //skull variables
  skull = loadShape("Skull.obj");
  
  //camera variables
  angle = 0;
  camSpeed = 5.0;
  x = width / 2.0;
  y = height / 2.0;
  z = viewDist = (height / 2.0) / tan(PI * 60.0 / 360.0);
  lookAtX = x;
  lookAtY = y;
  lookAtZ = 0;
  upX = 0;
  upY = 1;
  upZ = 0;
}


void draw(){
  colorMode(RGB, 255, 255, 255);
  background(0.125);
  stroke(255);
  strokeWeight(.01);
  lights();
  //ambientLight(255, 0, 0);
  directionalLight(0, 255, 0, .5, 1, 0); 
  //Lampshade starts here.
  //I added the if(mousePressed){} to stop the constant scrolling.
  if(mousePressed){
  lampshadeRot.x = map(mouseY, height / 2.0, -height / 2.0, 0, TWO_PI);
  lampshadeRot.y = map(mouseX, -width / 2.0, width / 2.0, 0, TWO_PI);
  }
  
  pushMatrix();
  
  translate(lampshadePos.x,lampshadePos.y,lampshadePos.z);
  rotateY(lampshadeRot.y);
  rotateX(lampshadeRot.x);
  scale(scale);
  
  //Front
  beginShape();
  texture(showDiagnosticImages ? texture : txtr);
  stroke(0);
  vertex(-.75, -1, .75, uOffset, vOffset);
  vertex(.75, -1, .75, uOffset + u, vOffset);
  vertex(1, 1, 1, uOffset + u, vOffset + v);
  vertex(-1, 1, 1, uOffset, vOffset + v);  
  endShape(CLOSE);
  
  // Back
  beginShape();
  texture(showDiagnosticImages ? texture : txtr);
  vertex(-.75, -1, -.75, uOffset, vOffset);
  vertex(.75, -1, -.75, uOffset + u, vOffset);
  vertex(1, 1, -1, uOffset + u, vOffset + v);
  vertex(-1, 1, -1, uOffset, vOffset + v); 
  endShape(CLOSE);
  
  // Left
  beginShape();
  texture(showDiagnosticImages ? texture : txtr);
  vertex(-.75, -1, -.75, uOffset, vOffset);
  vertex(-.75, -1, .75, uOffset + u, vOffset);
  vertex(-1, 1, 1, uOffset + u, vOffset + v);
  vertex(-1, 1, -1, uOffset, vOffset + v);
  endShape(CLOSE);
  
  //Right
  beginShape();
  texture(showDiagnosticImages ? texture : txtr);
  vertex(.75, -1, -.75, uOffset, vOffset);
  vertex(.75, -1, .75, uOffset + u, vOffset);
  vertex(1, 1, 1, uOffset + u, vOffset + v);
  vertex(1, 1, -1, uOffset, vOffset + v);
  endShape(CLOSE);
  
  popMatrix();
  //Lampshade ends here.
  
  //Sphere starts here.
  fill(255, 255, 255);
  pushMatrix();
  translate(spherePos.x, spherePos.y, spherePos.z);
  sphere(r);
  sphereDetail(15);
  popMatrix();
  //sphere ends here.
  
  //Skull starts here.
  pushMatrix();
  //skull.rotateX(0.01);
  skull.rotateY(0.02);
  skull.rotateZ(0.01);
  scale(.5);
  shape(skull, width * 0.4, height * 0.5);
  popMatrix();
  //Skull ends here.
  
  //Camera controlls start here.
  //Code borrowed from Example_10_8_Camera
  camera(x, y, z, lookAtX, lookAtY, lookAtZ, upX, upY, upZ);
  keys();

  //Open pyramid starts here.
  //I thought it could be any method of shape until I re-read the assignment document.
  //fill(255, 0, 0);
  /*
  pyrRot.x = map(mouseY, height / 2.0, -height / 2.0, 0, TWO_PI);
  pyrRot.y = map(mouseX, -width / 2.0, width / 2.0, 0, TWO_PI);
  
  pushMatrix();
  translate(pyrPos.x, pyrPos.y, pyrPos.z);
  rotateY(pyrRot.y);
  rotateX(pyrRot.x);

  beginShape();
  vertex(-100, -100, -100);
  vertex(100, -100, -100);
  vertex(0, 0, 100);
  endShape(CLOSE);
  
  beginShape();
  vertex(100, -100, -100);
  vertex(100, 100, -100);
  vertex(0, 0, 100);
  endShape(CLOSE);
  
  beginShape();
  vertex(100, 100, -100);
  vertex(-100, 100, -100);
  vertex(0, 0, 100);
  endShape(CLOSE);
  
  beginShape();
  vertex(-100, 100, -100);
  vertex(-100, -100, -100);
  vertex(0, 0, 100);
  endShape(CLOSE);
  endShape();
  
  popMatrix();*/
}
//End of Draw Function

//Code borrowed from Example_10_8_Camera
void keys() {
  if (keyPressed) {
    if (y > 0
      && (key == 'w' || key == 'W' || keyCode == UP)) {
      y -= camSpeed;
      lookAtY = y;
    }
    if (x > -extents
      && (key == 'a' || key == 'A' || keyCode == LEFT)) {
      x -= camSpeed;
      lookAtX = x;
    }
    if (y < height - 10
      && (key == 's' || key == 'S' || keyCode == DOWN)) {
      y += camSpeed;
      lookAtY = y;
    }
    if (x < extents
      && (key == 'd' || key == 'D' || keyCode == RIGHT)) {
      x += camSpeed;
      lookAtX = x;
    }
    if (z > -extents
      && (key == 'q' || key == 'Q')) {
            z -= camSpeed;
      lookAtZ = z - viewDist;
    }
    if (z < extents
      && (key == 'e' || key == 'E')) {
      z += camSpeed;
      lookAtZ = z - viewDist;
    }
  }
}
