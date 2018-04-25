void setup() {
  size(800,500);
}
void draw(){
  background (25);
  
//far back building on right
  noStroke();
  fill(75);
  rect(520, 120, 125, 380);
  
//side buildings
  noStroke();
  fill(100);
  rect(600, 250, 150, 250);
  rect(20, 250, 150, 250);
  
//window building
  fill(200);
  rect(303, 50, 200, 450);
  
  stroke(0);
  fill(255);
  ellipse(400, 165, 150, 150);
  
  line(400, 90, 400, 240);
  line(325, 165, 475, 165);
  
//Obsevatory
  noStroke();
  fill(255);
  ellipse(225, 500, 250, 250);
  rect(200, 300, 50, 100);
  ellipse(225, 275, 100, 100);
  
  stroke(0);
  fill(210);
  ellipse(225, 275, 50, 50);
  
//Moon
  noStroke();
  fill(235);
  ellipse(60, 60, 100, 100);
  fill(25);
  ellipse(80, 60, 75, 75);
  
//Stars
  stroke(255);
  strokeWeight(10);
  point(25,175);
  point(80,50);
  point(125,190);
  point(175,75);
  point(220,150);
  point(400,25);
  point(550,75);
  point(600,10);
  point(700,150);
  point(725,50);
}