#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Tuenti Challenge 3
#
# Challenge 13 - Sparse randomness

# Randomness is like a box of chocolates. You never know what you're gonna get

import sys
import array
from bisect import bisect_right

class SpecialSparseArray:
    def __init__(self, number_list):
        self.differences = array.array('l')
        self.differences.append(1)
        
        # Store the indexes where the number changes only
        for i in range(0, len(number_list) - 1):
            if number_list[i] != number_list[i + 1]:
                self.differences.append(i + 2)
                
        self.differences.append(len(number_list) + 1)
                
        
    def count_max_repetitions(self, interval):

        # Find the initial index
        pos = bisect_right(self.differences, interval[0]) - 1
        
        max_repetitions = 1
        beg_interval = interval[0]
        
        while self.differences[pos] <= interval[1]:
            repetitions = 0
                       
            if interval[1] < self.differences[pos + 1]:
                # Inclusive/closed ending, so repetitions + 1
                repetitions += 1
                next_index = interval[1]
            else:
                # Open ending
                next_index = self.differences[pos + 1]
            
            repetitions += next_index - beg_interval
            
            max_repetitions = max(max_repetitions, repetitions)
            pos += 1
            beg_interval = self.differences[pos]

        return max_repetitions
            
        

if __name__ == '__main__':
    num_cases = int(sys.stdin.readline())
    
    for num_case in range(num_cases):
        N, M = [ int(x) for x in sys.stdin.readline().split() ]
        
        number_list = [ int(x) for x in sys.stdin.readline().split() ]
            
        sparray = SpecialSparseArray(number_list)
        del number_list
        
        print "Test case #%d" % (num_case + 1)
        
        for m in range(M):
            b, e = [ int(x) for x in sys.stdin.readline().split() ]
            print sparray.count_max_repetitions((b, e))
        
        
