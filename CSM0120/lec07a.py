# -*- coding: utf-8 -*-
"""
Created on Fri Nov 30 18:05:48 2018

@author: AmyJade
"""

import matplotlib.pyplot as plt
import random
import numpy as np
import datetime as dt

"""
###SIMPLE OO EXAMPLE
y = random.sample(range(0, 1000), 100)
x = range(len(y))

figure = plt.figure()
axes = figure.add_subplot(111) #Access to the axes instance
l = plt.plot(x, y)
t = axes.set_title('Random Plot')
plt.show()

###MULTIPLE FIGURES
fig1 = plt.figure(); ax1 = fig1.add_subplot(111)
fig2 = plt.figure(); ax2 = fig2.add_subplot(111)

ax1.plot(x, y); ax1.set_title('Random Plot 1')
ax2.plot(x, y); ax2.set_title('Random Plot 2')

plt.show()


###MULTIPLE SUBPLOTS
fig = plt.figure()
ax1 = fig.add_subplot(211)
ax1.plot([1,2,3], [1,2,3])

ax2 = fig.add_subplot(212)
ax2.plot([1,2,3],[3,2,1])
plt.show()


###MULTIPLE AXES
x = np.arange(0., np.e, 0.01)
y1 = np.exp(-x)

fig = plt.figure()
a1 = fig.add_subplot(111)
ax1.plot(x, y1)
ax2.set_ylabel('y values for exp(-x)')

ax2 = ax1.twin(x)
y2 = np.log(x)

ax2.plot(x, y2, 'r')
ax2.set_ylabel('y values for ln(x)')
ax1.set_xlabel('Same x for both exp(-x) and ln(x)')

plt.show()


###PLOTTING EQUATIONS
plt.clf()

def gen_linear(m, c):
    xl = range(0, 10)
    yl = [m*x + c for x in xl]
    return(xl, yl)

def gen_plot():
    (x, y) = gen_linear(5,3)
    plt.plot(x, y, 'bv-')
    plt.show()
    
def gen_poly(a, n):
    xp = range(0, 10)
    yp = [a*(x**n) for x in xp]
    return (xp, yp)

def poly_plot():
    (x, y) = gen_poly(5, 3)
    plt.plot(x, y, 'rv-')
    plt.show()
    
def log_plot(): #Log scaling on x and y axis
    (x, y) = gen_poly(5, 3)
    plt.loglog(x, y, 'rv-')
    plt.show()

if __name__ == "__main__":
    gen_plot()
    poly_plot()
    log_plot()

    
###DATES
    #Timestamps (years/months/days h:m:s)
date = dt.datetime(1997, 1, 14)
print(date.weekday())

    #Converting string to datetime objects (date formatting)
x = "2018-07-19 6:09 PM GMT"

format = "%Y-%m-%d %I:%M %p %Z"
mydt = dt.datetime.strptime(x, format)

print(mydt.weekday())

    #Datetime objects can be manipulated and plotted
x = [dt.datetime.today() + dt.timedelta(days=i) for i in range(10)]
y = random.sample(range(100), 10)

plt.plot(x, y, 'ro-')
plt.gcf().autofmt_xdate()
plt.show()
"""

###PLOTTING REAL WORLD DATA
#-Import data from files
#-Read and plot values
#-Make decisions about axes
    """ - Y-scaling matters
        - No need to start from 0 point
        - Label all axes of every graph (descriptions and units)
        - Caption graphs in full
        - Avoid visual elements that are not necessary
        - Avoid too many colours and hatches if not necessary
        - Be consistent in scaling (especially for subplots)
        - Indicate statistical significance, explain in captions
        - Export in vector graphics (SVG, EPS, PDF)
        - Reuse your Python programs to plot
        
        i.e.
        'This is a graph of population size in London through thr Victorian era in Britain.
        
        The x-axis shows the years from 1940 to 1900
        
        The y-axis shows population in hundreds
        
        I'm showing this graph to point out how population in major cities sharply rose during the
        industrial revoluation and especially so after 1860 because of...'
    """