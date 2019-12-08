import tensorflow as tf
#import os
#os.environ['TF_CPP_MIN_LOG_LEVEL'] = '2'

print(tf.__version__)

W = tf.Variable(tf.ones(shape=(2,2)), name="W")
b = tf.Variable(tf.zeros(shape=(2)), name="b")

@tf.function
def forward(x):
  return W * x + b

out_a = forward([1,0])
print(out_a)
