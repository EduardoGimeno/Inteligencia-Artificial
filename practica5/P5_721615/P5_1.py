'''
Ejemplo de entrenamiento de un percepton para reconocer MNIST
v1.0 9-1-19
Eduardo Gimeno
'''

import keras
from keras.datasets import mnist
from keras.models import Sequential
from keras.layers import Dense, Dropout
from keras.optimizers import RMSprop, Adam, SGD
from keras.callbacks import EarlyStopping
import time
#from sklearn.metrics import confusion_matrix
import numpy as np
#import matplotlib.pyplot as plt
import P5_utils

verbose = True

print('Loading MNIST dataset...')
# Problem dimensions
img_rows, img_cols = 28, 28
num_pixels = img_rows * img_cols
num_classes = 10
# The data, split between train and test sets
(x_train, y_train), (x_test, y_test) = mnist.load_data()
x_train = x_train.reshape(60000, num_pixels)
x_test = x_test.reshape(10000, num_pixels)
x_train = x_train.astype('float32') / 255
x_test = x_test.astype('float32') / 255
print(x_train.shape[0], 'train samples')
print(x_test.shape[0], 'test samples')
# convert class vectors to binary class matrices
y_train = keras.utils.to_categorical(y_train, num_classes)
y_test  = keras.utils.to_categorical(y_test,  num_classes)
# Random permutation of training data
np.random.seed(0)
p = np.arange(x_train.shape[0])
np.random.shuffle(p)
x_train = x_train[p]
y_train = y_train[p]


# Funcion para parar cuando ya no mejora el error de validacion
earlystop=EarlyStopping(monitor='val_loss', patience=5, 
                        verbose=1, mode='auto')

# Perceptron de un solo nivel
model = Sequential()
model.add(Dense(10, activation='softmax', input_shape=(num_pixels,)))

model.compile(loss='mean_squared_error',
              optimizer=RMSprop(),
              metrics=['accuracy'])

model.summary()

print('Training the NN....')
t0 = time.clock()
history = model.fit(x_train, y_train,
                    batch_size=128,
                    epochs=30,
                    validation_split=0.1,
                    #callbacks=[earlystop],
                    verbose=verbose)

train_time = time.clock() - t0
print('%s %.3f%s' %  ('Training time: ', train_time, 's') )
P5_utils.plot_history(history)

# Evaluar la red
train_score = model.evaluate(x_train, y_train, verbose=0)
test_score = model.evaluate(x_test, y_test, verbose=0)
print('%s %2.2f%s' % ('Accuracy train: ', 100*train_score[1], '%' ))
print('%s %2.2f%s' % ('Accuracy test:  ', 100*test_score[1], '%'))

y_pred = model.predict(x_test)
P5_utils.plot_mnist_confusion_matrix(y_test, y_pred)
