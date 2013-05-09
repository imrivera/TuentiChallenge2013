#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Tuenti Challenge 3
#
# Challenge 9 - Defenders of the Galaxy

# You shall not pass!

import sys
import math

if __name__ == '__main__':
    num_cases = int(sys.stdin.readline())
    
    for num_case in range(num_cases):        
        # Integer W: width of the canyon, in meters
        # Integer H: length of the canyon, in meters
        # Integer S: price to train a soldier, in pieces of gold
        # Integer C: price to trigger a Crematorium, in pieces of gold
        # Integer G: amount of gold that you have 
        
        W, H, S, C, G = [ int(x) for x in sys.stdin.readline().split() ]
                                
        if W * S <= G:
            print -1
        else:
            max_T = 0
            
            max_soldiers = int(math.floor(G / S))
            for s in xrange(max_soldiers, -1, -1):
                rest_gold = G - (s * S)                
                c = int(math.floor(rest_gold / C))                                
                T = int(math.floor((c + 1) * math.floor(W * (H - 1) / (W - s) + 1)))
                                
                max_T = max(T, max_T)
        
        
            print max_T
        
        
        

