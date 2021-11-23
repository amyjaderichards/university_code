# -*- coding: utf-8 -*-
"""
Created on Wed Oct 31 16:25:43 2018

@author: AmyJade
"""

def birthday_message(age):
    if age>99:
        message = 'Happy Birthday From The Queen!'
    if age>20 & age<100:
        message = 44'Happy Birthday, Another Year Older!'
    if age<20:
        message = 'Happy Birthday, you are now ' + str(age) + '!'
    return message
        
        
"""
TO RUN THIS SCRIPT - TYPE INTO CONSOLE:
    import birthdaymessage
    print(birthdaymessage.birthday_message(~AGE~))
"""