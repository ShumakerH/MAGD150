//I started with the nested Push Pop example for a template.
//I adjusted some variables to different integers to satify my drawing.
//http://learningprocessing.com/examples/chp14/example-14-17-nested-push-pop
//Note: The "lights" work best with the mouse at the top left corner due to the translation.
float theta = 0;

PVector center;
PVector length1;
PVector mouse;

flashlight[] lights = new flashlight[10];

void setup() {
  size(500, 500);
  for (int h = 0; h < lights.length; h++){
    lights[h] = new flashlight();
  }
}

void draw() {
  background(5, 210, 255);
  stroke(0);
  translate(width/2, height/2);
  center = new PVector(0,0);
  length1 = new PVector(150, 0);
  mouse = new PVector(mouseX, mouseY);
  
//Theta is the ratation speed.
  theta = theta + 0.03;
  
  
  strokeWeight(2);
  mouse.sub(center);
  
//This scale adjusts the entire drawing; it increases the size by double its origional size.
  scale(2.0);
  for (float i = 0; i < TWO_PI; i += 0.9) {
    pushMatrix(); 
    rotate(theta + i);
    stroke(20);
    //length1.sub(center);
    //I cant get this same line to show up with vectors.
    line(center.x, center.y, length1.x, length1.y);
    noStroke();
    fill(255, 21, 7);
//This scaling causes the ellipse to shrink and move inward towards the center point. 
    scale(0.5);
    ellipse(150, 0, 100, 100);
//This scaling caused the ellipse to be slightly larger than the original size and overlap the smaller ellipse.
    scale(1.5);
    fill(232, 188, 34);
    ellipse(150, 0, 100, 100);
    popMatrix();
  }
  scale(0.5);
  for (int h = 0; h < lights.length; h++) {
    lights[h].movement();
    lights[h].display();
  }
}