
Perceptron perceptron;
Point[] points = new Point[100];
int trainingIndex = 0;

void setup(){
  size(800, 800);
  // ...
  perceptron = new Perceptron(3);  
  for(int i=0; i< points.length; i++){
    points[i] = new Point();
  } 
  
}


void draw(){
  // ...
  background(255);
  
  stroke(0); 
  //line(0, height, width, 0);
  Point p1 = new Point(-1, f(-1));
  Point p2 = new Point(1, f(1));
  
  line(p1.getX(), p1.getY(), p2.getX(), p2.getY());
  
  Point p3 = new Point(-1, perceptron.getY(-1));
  Point p4 = new Point(1, perceptron.getY(1));
  line(p3.getX(), p3.getY(), p4.getX(), p4.getY());
  
  for(int i=0; i< points.length; i++){
    points[i].show();
  }
  
  for(int i=0; i< points.length; i++){
    float[] inputs = {points[i].x, points[i].y, points[i].BIAS};
    int target = points[i].label;
    
    //perceptron.train(inputs, target);
    int guess = perceptron.guess(inputs);
    
    if(guess == target)
      fill(0, 255, 0);
    else
      fill(255, 0, 0);
    
    noStroke();
    ellipse(points[i].getX(), points[i].getY(), 16, 16);
  }
  
  /************************************************************************************/
  // Learn point by point , one by one it's optionall just to see step by step       //
  /**********************************************************************************/
  /*
  */
  Point one_point = points[trainingIndex];
  float[] inputs = {one_point.x, one_point.y, one_point.BIAS};
  int target = one_point.label;
  perceptron.train(inputs, target);
  trainingIndex++;
  if(trainingIndex == points.length) trainingIndex =0; // backe to to first point
  /*
   ****/
  
}

void mousePressed(){
  println(mouseX, mouseY);
  
  
  for(int i=0; i< points.length; i++){
    float[] inputs = {points[i].x, points[i].y, points[i].BIAS};
    int target = points[i].label;
    
    perceptron.train(inputs, target);
  }
}