
Perceptron perceptron;
Point[] points = new Point[100];
int trainingIndex = 0;

void setup(){
  size(800, 800);
  // ...
  perceptron = new Perceptron();  
  for(int i=0; i< points.length; i++){
    points[i] = new Point();
  } 
  // ..
  float[] inputs = {-1, .5};
  int guess;
  
  guess = perceptron.guess(inputs);
  println(guess);
  
}


void draw(){
  // ...
  background(255);
  
  stroke(0); 
  line(0, 0, width, height);
  for(int i=0; i< points.length; i++){
    points[i].show();
  }
  
  for(int i=0; i< points.length; i++){
    float[] inputs = {points[i].x, points[i].y};
    int target = points[i].label;
    
   // perceptron.train(inputs, target);
    int guess = perceptron.guess(inputs);
    
    if(guess == target){
      fill(0, 255, 0);
      noStroke();
      ellipse(points[i].x, points[i].y, 16, 16);
      
    }else{
      fill(255, 0, 0);
      noStroke();
      ellipse(points[i].x, points[i].y, 16, 16);
    }
  }
  
  /************************************************************************************/
  // Learn point by point , one by one it's optionall just to see step by step  !!!! //
  /**********************************************************************************/
  /*
  *
  Training one_point = points[trainingIndex];
  float[] inputs = {one_point.x, one_point.y};
  int target = one_point.label;
  perceptron.train(inputs, target);
  trainingIndex++;
  if(trainingIndex == points.length) trainingIndex =0; // backe to to first point
  *
  ****/
  
}

void mousePressed(){
  println(mouseX, mouseY);
  
  
  for(int i=0; i< points.length; i++){
    float[] inputs = {points[i].x, points[i].y};
    int target = points[i].label;
    
    perceptron.train(inputs, target);
  }
  
}
