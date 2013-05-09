#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Tuenti Challenge 3
#
# Challenge 17 - Silence on the wire

# Please gentlemen... look directly at the blinking light
# [Flashes neuralyzer]


'''
# CODE  USED TO DECODE THE INFORMATION IN THE VIDEO

import sys
import cv

if __name__ == '__main__':
    capture = cv.CaptureFromFile('video.avi')
    print capture
    
    frame_count = cv.GetCaptureProperty(capture, cv.CV_CAP_PROP_FRAME_COUNT)

    s1 = ''
    s2 = ''
    
    for f in range(int(frame_count)):
        frame = cv.QueryFrame(capture)
        if cv.Get2D(frame, 354, 411)[0] == 0:
            s1 += '1'
        else:
            s1 += '0'
            
        if cv.Get2D(frame, 354, 482)[0] == 0:
            s2 += '1'
        else:
            s2 += '0'

    print s1
    print 
    print s2
    
    print ''.join([ chr(int(s1[x:x+8],2)) for x in range(0,len(s1),8)])
    print ''.join([ chr(int(s2[x:x+8],2)) for x in range(0,len(s2),8)])
    
'''

# For each input N return the sum of digits of N!

import sys
import math

if __name__ == '__main__':
    for line in sys.stdin:
        number = int(line)
        
        text_factorial = str(math.factorial(number))

        sum = 0
        for c in text_factorial:
            sum += int(c)
        
        print sum
        
