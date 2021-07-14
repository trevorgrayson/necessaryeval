---
title: On Organizing Machine Learning Code
date: 2021-04-15 06:17:51
tags:
---

Data Scientists breaking up their notebooks into standard methods (or modules) can improve their process without interrupting their workflow.

The following proposed organization of code would aid in:

- faster deploy times
- less code refactoring
- interchangable functions
- easier code hand offs
- reproducable results

How do you run this? Try the [makeup](https://pypi.org/project/makeup/) (pypi.org) framework designed just for this.

```python
"""
Code taken from: https://scikit-learn.org/stable/tutorial/statistical_inference/supervised_learning.html

It has been modified to encapsulate and label sections of code.
"""
import numpy as np
from sklearn import datasets
from sklearn.neighbors import KNeighborsClassifier


def load(**kwargs):
    """
    "Get the data" this sparse function allows a framework
    to be able to swap out different data sets easily.
    """
    iris_X, iris_y = datasets.load_iris(return_X_y=True)
    return iris_X, iris_y


def features(X, y, **kwargs):
    """Optional method to transform data, add or remove columns"""
    # if i had pandas here, I would do something!
    return X, y


def split(X, y, **kwargs):
    np.random.seed(0)
    indices = np.random.permutation(len(X))
    X_train = X[indices[:-10]]
    y_train = y[indices[:-10]]
    X_test = X[indices[-10:]]
    y_test = y[indices[-10:]]

    return (X_train, y_train),\
           (X_test, y_test)


def train(X, y, **kwargs):
    """Create and fit a nearest-neighbor classifier"""
    model = KNeighborsClassifier()
    model.fit(X, y)

    return model


def predict(model, X, **kwargs):
    return model.predict(X)

```

tg.
