# -*- coding: utf-8 -*-
"""
Created on Fri Nov 30 20:42:05 2018

@author: AmyJade
"""

###OO Example

import matplotlib.pyplot as plt
import random

y = random.sample(range(0, 1000), 100)
x = range(len(y))

figure = plt.figure()
axes = figure.add_subplot(111) #Access to the Axes instance
l = plt.plot(x, y)
t = axes.set_title('random plot')
plt.show()