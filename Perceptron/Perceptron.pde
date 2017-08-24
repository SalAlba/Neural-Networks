

public class Perceptron{
  // fields ...
  private float[] weight;
  private float learinig_rate = 0.1;
  private final int NUM_INPUT = 2;
  
  
  // constructor ...
  Perceptron(){
    weight = new float[NUM_INPUT];
    
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
  
  // private ...
  private int activation(int toCheck){
    return toCheck > 0 ? 1 : -1;
  }
  
}