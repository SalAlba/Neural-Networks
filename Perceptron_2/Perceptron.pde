

public class Perceptron{
  // fields ...
  private float[] weight;
  private float learinig_rate = 0.21;
  //private final int NUM_INPUT = 3;  
  
  // constructor ...
  Perceptron(int n){
    weight = new float[n];
    
    for(int i=0; i< weight.length; i++){ 
      weight[i] = random(-1, 1);
    }
  }
  
  // fields ...
  int guess(float[] inputs){
    int sum = 0;
    for(int i=0; i< weight.length; i++){
      sum += inputs[i] * weight[i];
    }
    return activation(sum);
  }
  
  /**
   * target == label when target = 1 the white ellipse otherwise black
   *
   */
  void train(float[] inputs, int target){
    int guess = guess(inputs);
    int error = target - guess;
    
    for(int i=0; i < weight.length; i++){
      weight[i] += error * inputs[i] * learinig_rate;
    }
  }
  
  float getY(float x){
    float w0 = weight[0];
    float w1 = weight[1];
    float w2 = weight[2];
    return  - (w2/w1)-(w0/w1) * x;
  }
  
  // private ...
  private int activation(int toCheck){
    return toCheck > 0 ? 1 : -1;
  }
  
}
