#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Tuenti Challenge 3
#
# Challenge 8 - Tuenti Timing Auth

# I'm in

import sys
import urllib
import re

if __name__ == '__main__':
    for line in sys.stdin:
        line = line.rstrip('\r\n')
        post_data = urllib.urlencode({'key': line, 'pass[]': ['a']}, True)
        web = urllib.urlopen('http://pauth.contest.tuenti.net', data = post_data)
        m = re.match(r'welcome masteryour key: (\S+)', web.read())
        print m.group(1)
    

