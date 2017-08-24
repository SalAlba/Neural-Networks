

float f(float x){
  // y = m * x + b
  // y = 3 * x + 2
  return 0.3 * x + 0.2;
}





public class Point{
  // fields ...
  float x;
  float y;
  private final int BIAS = 1;
  int label;
  
  // constructor ...
  Point(){
    //x = random(width);
    //y = random(height);
    x = random(-1, 1);
    y = random(-1, 1);
    float lineY = f(x);
    label = y > lineY ? 1 : -1;
  }
  
  Point(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  // methods ...
  public void show(){
    stroke(0);
    
    if(label == 1){
      fill(255);
    }else{
      fill(0);
    }
    
    ellipse(getX(), getY(), 32, 32);
      
  }
  
  
  // Two functions below change the system axi of computer  to Cartesian system 
  float getX(){
    return map(x, -1, 1, 0, width);
  }
  
  float getY(){
    return map(y, -1, 1, height, 0);
  }
  
  
}