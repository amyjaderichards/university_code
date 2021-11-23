# -*- coding: utf-8 -*-
"""
Created on Wed Nov 28 12:54:02 2018

@author: AmyJade
"""

#Lecture 6b - Plotting Using Matplotlib

import matplotlib.pyplot as plt
from pathlib import Path
import random
import numpy as np

x = [1, 2, 3, 4, 5]
y = [10, 12, 15, 22, 28]
errors = [2.2, 1.5, 1.8, 2.8, 1.4]

plt.clf() #Clearing previous figure(s) in window

plt.plot(x, y, 'b-', x, y, 'ro')
plt.errorbar(x, y, yerr=errors, fmt='None', ecolor='g', mew=2, capsize=5)
plt.axis([0, 6, 1, 33])
plt.ylabel('y axis label')
plt.xlabel('x axis label')
plt.show()

###

plt.clf() #Clearing previous figure
 
x = range(1, 5, 1)
plt.plot(x, [i*1.5 for i in x], label='Normal')
plt.plot(x, [i*3.5 for i in x], label='Fast')
plt.grid(True)
plt.title('Growth of some measures')
plt.xlabel('Samples'); plt.ylabel('Values')
plt.legend(loc='upper left')

homedir = str(Path.home())
plt.savefig(homedir + '/example_plot.png')

###

plt.clf() #Clearing previous figure

plt.bar([1,2,3,4], [3, 2, 6, 3])
plt.show()

###

plt.clf()

x = [1, 2, 3, 4]
y = [3, 2, 6, 3]

plt.bar(x, y)
plt.xticks(x, ('A', 'B', 'C', 'D'))
plt.show()

###

plt.clf() #Clearing previous figure

#dict = {u'Apple': 10, u'Orange':20, u'Banana':30, u'Cherry':40}

for i, key in enumerate(dict):
    plt.bar(i, dict[key])
    
plt.xticks(range(len(dict)), list(dict.keys()))
plt.yticks(list(dict.values()))
plt.show()

###
#GROUPED BAR CHARTS
plt.clf()

barwidth=0.25
mouse = [10, 12, 20, 15]
human = [11, 14, 5, 5]
bat = [3, 5, 9, 1]

mloc = range(len(mouse))
hloc = [x + barwidth for x in mloc]
bloc = [x + barwidth for x in hloc]

plt.bar(mloc, mouse, barwidth, color='r', label='mouse')
plt.bar(hloc, human, barwidth, color='b', label='human')
plt.bar(bloc, bat, barwidth, color='g', label='bat')

plt.xticks([x + barwidth for x in range(4)], ('A', 'T', 'C', 'G'))

plt.legend()
plt.show()

###
#STACKED BAR CHARTS
plt.clf()

barwidth = 0.55
x = [0, 1, 2, 3]

group_a = [10, 12, 7, 15]
group_b = [11, 14, 5, 25]

plt.bar(x, group_a, barwidth, color='r', label='group a')
plt.bar(x, group_b, barwidth, bottom=group_a, color='b', label = 'group b')

plt.xticks(x, ('1', '2', '3', '4'))
plt.ylabel('attendees')
plt.xlabel('activities')

plt.legend()
plt.show()

###
#ERROR BARS AND BAR CHARTS
plt.clf()

barwidth = 0.6
x = [0, 1, 2, 3]

amean = [10, 12, 7, 15]
bmean = [11, 14, 5, 25]

aerrors = [2.2, 1.5, 1.8, 2.8]
berrors = [1.2, 0.5, 0.8, 1.8]

plt.bar(x, amean, barwidth, color='g', label='group a', yerr=aerrors, ecolor='r', capsize=4)
plt.bar(x, bmean, barwidth, bottom=amean, color='y', label = 'group b', yerr=berrors, ecolor='b', capsize=4)

plt.xticks(x, ('1', '2', '3', '4'))
plt.ylabel('attendees')
plt.xlabel('activities')

plt.legend()
plt.show()


###
#PIE CHARTS
plt.clf()

labels = ['Muhammed', 'Lisa', 'James', 'Mary']
sizes = [15, 8, 35, 10]
explode = (0.1, 0.3, 0, 0)
colors = ('r', 'b', 'g', 'c')

#plt.pie(sizes, explode=explode, labels=labels, autopct='%1.1f%%', shadow=True, startangle=90, colors=colors)

#plt.axis('equal')
#plt.show()


###
#NESTED PIE CHARTS
plt.clf()

labels = ['Muhammed', 'Lisa', 'James']
sizes = [[60, 30], [50, 50], [30,10]]

sizes_sums = []
for i in range(len(sizes)):
    sizes_sums.append(sizes[i][0] + sizes[i][1])
    
sizes_flatten = []
for pair in sizes:
    for item in pair:
        sizes_flatten.append(item)

cmap = plt.get_cmap('tab20c')

outer_colours = cmap([0, 4, 8])
inner_colours = cmap([2, 3, 6, 7, 9, 10])

#plt.pie(sizes_sums, radius=1, labels=labels, wedgeprops=dict(width=0.3, edgecolor='w'), colors=outer_colours)

#plt.pie(sizes_flatten, radius=0.7, wedgeprops=dict(width=0.3, edgecolor='w'), colors=inner_colours)

#plt.axis('equal')
#plt.show()


###
#SCATTER PLOTS
    #Used to identify and show potential associations
plt.clf()

x = []; y=[]; r=[]

for i in range(50):
    x.append(random.uniform(0.0,1.0))
    y.append(random.uniform(0.0, 1.0))
    r.append(random.uniform(1,50)**2)
    
plt.scatter(x, y, marker='h', s=r, c='r', alpha=0.5) #Marker 'h' is hexagon
plt.show()
    
### 
#HISTOGRAM
    #Graphical display of frequencies
    #Categories are called bins
    
plt.clf() #Clearing previous figure

x = [21, 22, 23, 4, 5, 6, 77, 8, 9, 10, 31, 32, 33, 35, 49, 18, 50, 100]
bins = 5

plt.hist(x, bins, facecolor='g')
plt.show()


plt.clf()

np.random.seed(144)
d = np.random.laplace(loc=0, scale=1, size=500)

plt.hist(x=d, bins='auto', color='b', rwidth=0.85)

plt.grid(axis='y', alpha=0.75)
plt.xlabel('value'); plt.ylabel('frequency')
plt.title('Plotting Laplace($\mu,b$) Distribution')
plt.text(2, 50, r'$\mu=0, b=1$')
plt.show()

#Multiple Data in Histograms
plt.clf() #Clearing previous figure

d1 = np.random.normal(0, 0.8, 1000)
d2 = np.random.normal(-2, 1, 1000)
d3 = np.random.normal(3, 2, 1000)

#kwargs = dict(histtype='stepfilled', density=True, bins=40)
#histtype - 'bar', 'barstacked', 'step', 'stepfilled'

plt.hist(d1, **kwargs)
plt.hist(d2, **kwargs)
plt.hist(d3, **kwargs)

plt.show()

###
#TEXT AND ANNOTATIONS

random.seed(156)
x = []; y=[]; p=42

for i in range(50):
    x.append(random.uniform(0.0, 1.0))
    y.append(random.uniform(0.0, 1.0))
    
kwargs = dict(facecolor='black', width=1, shrink=0.05)
plt.annotate('the answer', xy=(x[p], y[p]), fonrsize='large', xytext=(0.1, 0.3), arrowprops = kwargs)

plt.scatter(x, y, s=10, c='b')
plt.show()
