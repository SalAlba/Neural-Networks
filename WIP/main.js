
// [0] preaber L : date records to learn.
/***************************************
 *  L = [ {[x1, x2, ..., xn], d} ]
 *  
 * L : learnig record.
 * x : inputs
 * d : desired answer "output"
 ***************************************/
var L = [
    { x: [1], d: 1 },
    { x: [0.1], d: 1 }
];


var INPUT_NUM = 1;
var BIAS = 1;

// [1] Init values.
/***************************************
 * t == iteration == epoch.
 * k == num. of rekord to learn or check from learning records.  ?????
 * lpd == num. of corect answers and it's the stop criterium.
 * w == weights first init random from this range <-1, 1>
 *  * [ d^k - y^k ] x : learning rate range  [0, 1> , don't use zero.
 * BIAS : always one.
 ***************************************/
var t = 0;
var k = 0;
var lpd = 0;
var lr = 1;
var weight = [];

//

// init a random wheits

var initWeights = () => {
    for (var i = 0; i < INPUT_NUM + 1; i++) {
        weight[i] = Math.floor(Math.random() * 3 - 1);
    }
    return weight;
}

// [2] count net output.
/***************************************
 *  W^T * X
 *  W : vector of weights, ^T transpose.
 *  X : vector of inputs.
 ***************************************/


var netOutput = () => {
    var w = transpose(weight);
    var x = [BIAS, ...L[k].x];

    // renmber length give the number of elemnts in row
    // [1, 2, 3].length == 3  the number of elments in one row
    // [ [1], [2], [3]].length == 3  here the number of rows
    if( w.length !== x.length){
        console.log('Cant to mult matrix !!');
        return;
    }
    
    return mult_vector(w, x);    
}

// [3] get the output  by activation function checking.

var activation = (netOutput) => {
    return linear_activation(netOutput);
}

// [4] weights adaption.
/***************************************
 * 
 *  w^(t+1) = w^t + lr * [ d^k - y^k ] x^k
 * 
 ***************************************/

var updateWeight = (d, y, x) => {
    for(var i=0; i<weight.length; i++){
        weight[i] = weight[i] + lr * (d - y) * x[i];
    }
    // console.log(weight);
}


// private methods ...
var reshape = (arr) => {
    var row = arr.length;
    var col = arr[0].length;
    var tmp = [];

    for (var i = 0; i < col; i++) {
        tmp[i] = [];
        for (var j = 0; j < row; j++) {
            tmp[i][j] = 0;
        }
    }
    return tmp;
}

var reshape_vector = (vector) => {
    var tmp = [];
    for(var  i=0; i<vector.length; i++){
        tmp[i] = [];        
    }      
    return tmp;
}

// transposes methods ...
var transpose_s = (arr) => {
    var tmp = [];

    for(var i=0; i< arr.length; i++){
        tmp[i] = [];
        for(var j=0; j< arr[i].length; j++){
            tmp[i][j] = arr[j][i];
        }
    }

    return tmp;
}

var transpose_rows = (arr) => {
    var tmp = reshape(arr);
    for (var i = 0; i < arr.length; i++) {        
        for (var j = 0; j < arr[i].length; j++) {
            tmp[j][i] = arr[i][j];
        }
    }

    return tmp;
}

var transpose_vector = (vector) => {
    var tmp = reshape_vector(vector);
    for(var  i=0; i<vector.length; i++){
        tmp[i][0] = vector[i];    
    }

    return tmp;
}

var transpose = (arr) => {
    if( arr[0].length === undefined)
        return transpose_vector(arr);
    else return arr.length === arr[0].length ? transpose_s(arr) : transpose_rows(arr);
}


// mult methods ...

// save the order
var mult_vector = (v1, v2) => {
    var tmp = 0;
    for(var i=0; i< v2.length; i++){
        tmp += v1[i][0] * v2[i];
    }
    return tmp;
}


// activation function 

// linear ...
var linear_activation = (netOutput) => {
    return netOutput >= 0 ? 1 : 0;
}

// ...
initWeights();

// lpd != L.length ||  //never ending
while(  t != 5){
    if(k == L.length)  k = 0;
    //
    console.log('epoch : '+t);
    console.log('weight :'+ weight)
    console.log('input :'+ [BIAS, ...L[k].x]);
    
    var net = netOutput();
    var y = activation(net);
    var x = [BIAS, ...L[k].x];
    updateWeight(L[k].d, y, x);
    
    if(y == L[k].d) 
        lpd++;
    
    k++;
    t++;
    
    console.log('updated weight :'+ weight)
    console.log('--------------------------');
}
