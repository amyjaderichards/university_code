# -*- coding: utf-8 -*-
"""
Created on Tue Nov 20 18:38:08 2018

@author: AmyJade
"""

#Basic pyplot plot of a straight line
#Changed tools>preferences so it prints in a new screen not inline, 
#this is useful because you can save it, zoom etc.
import matplotlib.pyplot as plt

plt.plot([1,2,3,4])
plt.show()

x=range(6)
plt.plot(x, [i**2 for i in x])
plt.show()

plt.plot([10, 20, 30, 40], [1,3,2,4])
plt.ylabel('the y axis name', labelpad=5, fontsize=10) #labelpad = labelpadding
plt.xlabel('some x axis name', family='sans-serif')
plt.show()

#Other font options -
    #fontstyle 'normal' 'italic' 'oblique'
    #fontweight 'light' 'normal' 'regular' 'bold' etc.
    
    
'''
plot([x], y, [fmt], data=None, **kwargs)
plot([x], y, [fmt], [x2], y2, [fmt2], ..., **kwargs)

fmt = '[color][marker][line]'
Optional keywords to specify properties of 2D lines - label, linewidth etc.
'''
x = [10, 20, 30, 40]
y = [1, 2, 3, 4]
plt.plot(x, y, 'rs:')
plt.ylabel('the y axis')
plt.xlabel('the x axis')
plt.show()


'''
locs, labels = xticks()
xticks(ticks, [labels], **kwargs)
'''
locs, labels = plt.xticks()
print(locs)
print(labels[0])

x = [10, 20, 30, 40, 50]
y = [1, 2, 3, 4, 5]

plt.xticks(range(10, 60, 10), ('p0', 'p1', 'p2', 'p3', 'p4'))
plt.plot(x, y, 'r*-', markersize=10)
plt.show()


'''
TITLES AND LEGENDS
'''
data = [[10, 20, 30, 40], [1, 2, 3, 4]]
weights = (1.0, 0.25, 0.4, 0.8)

y1 = []
for i, w in zip(data[1], weights):
    y1.append(i*w)
 
#print(data[1])
#print(weights)
#print(list(zip(data[1], weights)))
    
plt.plot(data[0], data[1], 'b-', data[0], y1, 'r-')
plt.title('This is a pretty plot', loc='left', pad=5)
plt.ylabel('This is the y axis'); plt.xlabel('This is the x axis')
plt.show()