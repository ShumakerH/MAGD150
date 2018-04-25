//I started with Ex_1_9_motion101_acceleration_array for a template.
//most of the coding is the same, I changed very few things.
class flashlight{
  PVector position;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  
  flashlight(){
    position = new PVector(random(width), random(height));
    velocity = new PVector(0, 0);
//I adjusted the topspeed to 10; 5 was too slow for the sketch.
    topspeed = 10;
  }
  
  void movement(){
    PVector mouse = new PVector(mouseX, mouseY);
    acceleration = PVector.sub(mouse, position);
//This both normalizes the vector and then sets the size to 20% of it's new size.    
    acceleration.setMag(0.2);

    velocity.add(acceleration);
    velocity.limit(topspeed);
    position.add(velocity);
  }
  
  void display(){
    noStroke();
    fill(random(0,255));
    ellipse(position.x, position.y, 25, 50);
    strokeWeight(2);
  }
}
    