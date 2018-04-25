raindrop raindrop1;
raindrop raindrop2;
raindrop raindrop3;
raindrop raindrop4;
raindrop raindrop5;
raindrop raindrop6;

void set(){
  surface.setResizable(true);
  background(87);
  size(800, 600);
  raindrop1 = new raindrop();
  raindrop2 = new raindrop();
  raindrop3 = new raindrop();
  raindrop4 = new raindrop();
  raindrop5 = new raindrop();
  raindrop6 = new raindrop();
  colorMode(HSB, 360, 100, 100);
}

void draw(){
  background(221, 75, 91);
  raindrop1.move();
  raindrop1.display();
  raindrop2.move();
  raindrop2.display();
  raindrop3.move();
  raindrop3.display();
  raindrop4.move();
  raindrop4.display();
  raindrop5.move();
  raindrop5.display();
  raindrop6.move();
  raindrop6.display();
  strokeWeight(10);
  color(255);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);
}