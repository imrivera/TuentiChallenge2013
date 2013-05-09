#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Tuenti Challenge 3
#
# Challenge 1 - Bitcoin to the future

# "You see this book? This book tells the future. Tells the results of every major sports event till the end of this century--"
#    —Old Biff discussing the almanac with his younger self in 1955

import sys


def get_interval(l):
	incremental = True
	
	interval = []
	if len(l) <= 1:
		return (incremental, l[:])

	interval = [l[0]]
	pos = 0
		
	if l[0] < l[1]:
		incremental = True
		while pos < len(l) - 1 and l[pos] < l[pos + 1]:			
			interval.append(l[pos + 1])
			pos += 1
			
	else:
		incremental = False
		while pos < len(l) - 1 and l[pos] >= l[pos + 1]:			
			interval.append(l[pos + 1])
			pos += 1
	
	return (incremental, interval)
	

def buy(value, euros, bitcoins):
	bitcoins += euros // value
	euros = euros % value
	
	return euros, bitcoins
	
def sell(value, euros, bitcoins):
	euros += bitcoins * value
	bitcoins = 0
	
	return euros, bitcoins
	

if __name__ == '__main__':
	total_cases = int(sys.stdin.readline())
	
	for num_case in range(total_cases):
		bitcoins = 0
		euros = int(sys.stdin.readline())
		values = [ int(x) for x in sys.stdin.readline().split() ]
		
		pos = 0
		while pos < len(values):
			incremental, interval = get_interval(values[pos:])
			pos += len(interval)
			
			if incremental:
				euros, bitcoins = buy(interval[0], euros, bitcoins)
				euros, bitcoins = sell(interval[-1], euros, bitcoins)
			else:
				euros, bitcoins = sell(interval[0], euros, bitcoins)
				# In the last interval we don't want to buy bitcoins
				if pos < len(values):
					euros, bitcoins = buy(interval[-1], euros, bitcoins)
					
		print euros
