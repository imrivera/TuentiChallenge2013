#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Tuenti Challenge 3
#
# Challenge 15 - The only winning move is not to play


# McKittrick: It might help to beef up security around the W.O.P.R. 


import urllib2
from base64 import b64decode, b64encode
import phpserialize
import requests
import sys
import hashlib
import re

url = 'http://ttt.contest.tuenti.net'

# Found by brute force with the information found in page.php~
secret_salt = 'IETN'

if __name__ == '__main__':
        
        for line in sys.stdin:
            keyfile = line.rstrip('\r\n')
        
            r = requests.get(url)
        
            game_cookie = urllib2.unquote(r.cookies['game']).split('|')[0]        
            php_data = phpserialize.loads(b64decode(game_cookie), object_hook=phpserialize.phpobject)        
        
            php_data.versionFile = '/home/ttt/data/keys/' + keyfile
            text_cookie = phpserialize.dumps(php_data)
        
            cookie = b64encode(text_cookie)
            m = hashlib.md5()
            m.update(cookie + secret_salt)
            cookie += '|' + m.hexdigest()
        
            r = requests.get(url, cookies = {'game':cookie})
            match = re.search(r'X-Tuenti-Powered-By=([a-fA-F0-9]+)', r.headers['set-cookie'])
            print match.group(1)
        
