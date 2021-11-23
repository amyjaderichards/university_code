# -*- coding: utf-8 -*-
"""
Created on Wed Oct 17 14:11:45 2018

@author: AmyJade
"""

#CSM0120 PROGRAMMING FOR SCIENTISTS - PRACTICAL 1

##1
my_DNA = "ATTATTATTGC"

if my_DNA.endswith("GC"):
    print("Has a sticky end")

print("Number of Ts: " + str(my_DNA.count("T")))
print("Length: " + str(len(my_DNA)))

##2
today = "Friday"

if today.startswith("S"):
    print("This is a weekend day")
else:
    print("This is a weekday")
    
    
##3 
length = 20
width = 15
height = 48

volume_of_suitcase = length * width * height

if volume_of_suitcase < 14500:
    print('Suitcase is too small')
elif volume_of_suitcase > 14499:
    print('Suitcase is big enough')
    
##4 
switch1 = 1
switch2 = 0

if switch1 & switch2 == 1:
    print('on')
elif switch1 & switch2 == 0:
    print('off')
elif switch1 == 1 & switch2 == 0:
    print('off')
elif switch1 == 0 & switch2 == 1:
    print('off')
    
##5
secret = 20
guess = 15

if guess > secret:
    print('Your guess is too high')
elif guess < secret:
    print('Your guess is too low')
elif guess == secret:
    print('Correct!')
    
##6
day = 1
while day != 31:
    if day == 1 or day == 8 or day == 15 or day ==22 or day ==29:
        print(str(day) + '!')
    else:
        print(day)
    day += 1
    
##7
n = 1
while n != 13:
    print('3 times ' + str(n) + ' is ' + str(3*n))
    n+=1
    
##8
m = 1
while m != 13:
    n = 1
    while n != 13:
        print(str(m) + ' times ' + str(n) + ' is ' + str(m*n))
        n += 1
    m += 1
    
##9
m = 12
while m != 0:
    n = 12
    while n != 0:
        print(str(m) + ' times ' + str(n) + ' is ' + str(m*n))
        n -= 1
    m -= 1