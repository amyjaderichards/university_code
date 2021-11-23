# -*- coding: utf-8 -*-
"""
Created on Wed Oct 17 14:39:17 2018

@author: AmyJade
"""

#CSM0120 PROGRAMMING FOR SCIENTISTS - PRACTICAL 2

import random

##1
number1 = input('Enter a number: \n')
number2 = input('Enter another number: \n')

product = int(number1) * int(number2)
print('The product of both numbers is ' + str(product) + '\n')

##2
x = 3

#three times tables
for i in range(1, 13):
    print(str(x) + ' times ' + str(i) + ' is ' + str(i*x))

#all times tables from 1 to 12
for i in range(1, 13):
    for x in range(1, 13):
        print(str(x) + ' times ' + str(i) + ' is ' + str(i*x))
        

##3
towns = [] #empty list
for i in range(1, 6):
    town = input('Enter a town in Wales: ')
    towns.append(town)
    
print(sorted(towns))

##4
DNA_String = []

for i in range(1, 101):
    c = random.choice(['A', 'C', 'G', 'T'])
    DNA_String.append(c)

print(DNA_String) #Characters in a list
print(''.join(DNA_String)) #Printing as a string

##5
sentence = input('Please enter a sentence: ')
vowels = ['a', 'e', 'i', 'o', 'u']

for c in sentence:
    if c not in vowels:
        print(c)

##6
        #The function chr() will produce the character that corresponds
        #to an ASCII numeric value i.e. 'A' is 65, 'B' is 66
letters = []
for num in range(65, 91):
    letters.append(chr(num))

rlist = random.sample(letters, 10)

print('Here is the list of random letters: ' + str(rlist))
word = input('Type a word that can be made from the letters: ')

if len(word) < 3:
    print('Word is less than three characters')

#b not finished
#c not finished
    
##7
#Not finished