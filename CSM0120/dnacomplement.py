# -*- coding: utf-8 -*-
"""
Created on Wed Oct 31 16:31:10 2018

@author: AmyJade
"""

def complement(DNA_String):
    #Dictionary of DNA complements
    complements = {'A':'T', 'T':'A', 'C':'G', 'G':'C'}
    
    s = ""
    for c in DNA_String:
        s += complements[c]
    return s
    
"""
To run this script type into the console -
import dnacomplement
dnacomplement.complement(~DNA_STRING~)
"""