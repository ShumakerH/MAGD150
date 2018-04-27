//I turned in the assignment so I got at least 10 points.
//I don't understand how the programming actually works with numbers and operations.
//To me it feels like its written in a forien language.
//I would like to schedule an appointment, if it's possible, to better understand the lesson.
//I understand that I will fail the assignment if not met criteria and it may drastically effect my grade.
//The drawing I have is my attempt to understand the assignment.

boolean flipFlopper; // default value is false

int red; // default value is 0
int green;
int blue;

float deltaMouseX; // default value is 0.0
float deltaMouseY;

float w = 30;
float h = 30;

//Taken from the VoidSetup Example so it would make the sketch work.

void setup(){
  
  surface.setResizable(true);
  size(500,500);
  background(78);
  frameRate(120);
}

void draw(){
  
  background(0);
  
//used the grid from the Coordinates Tool
//I don't understand how this works.

  pushStyle();
  stroke(50);
  for (float x = 50; x < width; x += 50) {
    line(x, 0, x, height);
    }
    
  for (float y = 50; y < height; y += 50) {
    line(0, y, width, y);
    }
    popStyle();
    
//Me experimenting with shape(mouseX, mouseY).
//I tried to get it to grow to half the size of the window
  w = (w + 1) % (height / 5.0);
  h = (h + 1) % (height / 5.0);

  fill(255, 0, 0);
  ellipse(mouseX, mouseY, w, h);

//I don't understand how this works

  println("(" + mouseX + ", " + mouseY + ")");
  
  deltaMouseX = mouseX - pmouseX;
  deltaMouseY = mouseY - pmouseY;

  println("delta: (" + deltaMouseX + ", " + deltaMouseY + ")");

  flipFlopper = !flipFlopper;
  println("flippFlopper = " + flipFlopper);
  
//I wanted to build a heart but I didn't understand how to build a
//beginShape() into shape(mouseX, mouseY).
//I wanted the heart look like it's growing to mimic a heartbeat 
//that could follow your mouse.
//It would go small, medium, large, small, medium, large, etc.
//It would be static, for 3 seconds on each heart.
//Similar to gaining a heart in a vintage game.
//I have it commented out to fix it later.
//The ellipse is for at least one shape.

  //beginShape(mouseX, mouseY);
    //vertex(150, 200);
    //vertex(200, 150);
    //vertex(250, 200);
    //vertex(300, 150);
    //vertex(350, 250);
    //vertex(250, 350);
    //vertex(150, 250);
  //endShape(CLOSE);
  
//Not sure how to constrain it in a circle.

}    