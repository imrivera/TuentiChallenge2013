#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Tuenti Challenge 3
#
# Challenge 16 - Legacy code


# Short-circuit: MAJOR INPUT!! INPUT!! INPUT!! MORE INPUT!!


'''

 You can generate a graph of the state machine using the .dot code at the end
 of this file.
 
 Analyzing the machine we know that the input will have the format of:
 
 #X#N1#N2#N3# ... #Nn#
 
 The operation is R = X * (N1 + N2 + N3 + ... + Nn)
 
 The cycle between state1 and state9 duplicates X times the operands N
 The cycle in the state21 sums the operands and trims the string
 
 The output should be:
 #R#
'''

import sys

if __name__ == '__main__':
    for line in sys.stdin:
        bin_numbers = line.rstrip('\r\n')[1:-1].split('#')
        
        X = int(bin_numbers[0], 2)
        output_bits = len(bin_numbers[0])
        
        sum = 0
        for number in bin_numbers[1:]:
            sum += int(number, 2)
            
        # Convert to text
        R = bin(X * sum)[2:]
        
        R = ('0' * (output_bits - len(R))) + R
        
        print "#%s#" % R
        
        
        
        

