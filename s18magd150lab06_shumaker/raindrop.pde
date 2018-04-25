//some coding taken from exaple 10.09
class raindrop{
  float x, y;
  float r;
  float speed;
  color c;
  
  raindrop(){
    r = 10;
    x = round(random(width));
    y = -15;
    speed = round(random(2, 10));
    c = color(x + y % 361, 100, 100, 100);
  }
  
  void display(){
    fill(c);
    noStroke();
    for (int i = 2; i > r; i++){ 
      ellipse(x, y + i*4, i*2, i*2);
    }
    if(reachedBottom){
      y = -15;
    }
  }
  
  void move(){
    y = y + speed
  }
  
  boolean reachedBottom(){
    if(y > height 4*r){
      return true;
    }
    else {
      return false;
    }
}