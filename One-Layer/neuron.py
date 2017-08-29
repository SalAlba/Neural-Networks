#!/usr/bin/python
import random
import math
import numpy as np

# fields ...
s = 3
k = 1
X = [1, 4, 6]

# methods ...

def init(s, k):
    w = []
    for i in range(s):
        tmp = []
        for j in range(k):
            val = random.uniform(-1.0, 1.0)
            tmp.append(np.around(val))
            # tmp.append(0.458)
        w.append(tmp)
    return w



def showList (array):
    for i in range(len(array)):
        for j in range(len(array[0])):
            print array[i][j],
        print
    return

def activation_sigmoid(x):
    return np.around( 1 / (1 + math.exp(-x)) )


def active(weight, x):
    col = len(weight[0])
    row = len(x)
    Y = []

    if( col != row ):
        print 'Matrix multiplication Erorr, r != w'
        return
    
    net_input = np.dot(weight, x)


    return [ activation_sigmoid(net_input[i]) for i in range(len(net_input))]



# workspace ...
w = init(s, k)
active(np.transpose(w), X)

print w
print X
print active(np.transpose(w), X)