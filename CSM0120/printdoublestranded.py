# -*- coding: utf-8 -*-
"""
Created on Wed Oct 31 16:38:14 2018

@author: AmyJade
"""
import dnacomplement

def print_double_stranded(DNA_String):
    print(DNA_String)
    
    for i in range(1, len(DNA_String)):
        print('|', end= " ")
    
    print('\n')   
    print(dnacomplement.complement(DNA_String))