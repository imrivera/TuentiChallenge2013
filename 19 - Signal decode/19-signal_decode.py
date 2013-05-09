#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Tuenti Challenge 3
#
# Challenge 19 - Signal decode

# AH AH AH YOU DIDN'T SAY THE MAGIC WORD!

import sys


# keys = [ 442, 84, 158, 1615, 2316 ]
codes = [ 4223, 416, 815, 158, 164 ]

if __name__ == '__main__':
    for line in sys.stdin:
        number = int(line)
        print codes[number]
