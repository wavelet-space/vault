

import tensorflow as tf

from tensorflow.keras.datasets import mnist


(x_train, y_train), (x_test, y_test) = mnist.load_data()

x_test /= 255.0
x_train /= 255.0 

