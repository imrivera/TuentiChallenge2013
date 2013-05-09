#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Tuenti Challenge 3
#
# Challenge 2 - Did you mean...?

# "It looks like you're writing a letter. Would you like help?"
#    -- Clippy 1997 - 2004

import sys
import marshal
import os.path
from collections import defaultdict


def get_index_filename(dictionary_name, length = None):
	""" Returns the name of an index file """
	name = dictionary_name + '.index'
	if length is not None:
		name += '.' + str(length)
		
	return name
	

def get_key(word):
	""" Generates a key/hash for each word, the key is a sorted tuple
		with pairs of letter/ocurrences
	"""
	d = defaultdict(int)
	
	for letter in word:
		d[letter] += 1
		
	return tuple([ (letter, d[letter]) for letter in sorted(d.keys()) ])	
	

def generate_index(dictionary_name):
	""" Generates the index files for faster lookup.
		Creates a file for each word length.
		Each file is a dictionary dumped in binary format with "marshal".
		Each value is a list of words that correspond to a key ordered in alphabetical order
	"""
	
	# Each key is the word len, in the inner dictionary the key is the key/hash of the word,
	# and the value is a list of words
	global_index = defaultdict(lambda: defaultdict(list))
	
	f = open(dictionary_name, "r")
	for word in f:
		word = word.rstrip('\r\n')
		global_index[len(word)][get_key(word)].append(word)
	f.close()
	
	for size, index in global_index.iteritems():
		f = open(get_index_filename(dictionary_name, size), "wb")
				
		for key, l in index.iteritems():
			l.sort()
			
		marshal.dump(dict(index), f)
		f.close()
		
	# Creates an empty index file, just for time tracking
	open(get_index_filename(dictionary_name), "w")
	

def check_index(dictionary_name):
	""" Checks if the index needs to be regenerated """
	index_dummy_filename = get_index_filename(dictionary_name)
	dict_mtime = os.path.getmtime(dictionary_name)
	if not os.path.exists(index_dummy_filename) or os.path.getmtime(index_dummy_filename) <= dict_mtime:
		generate_index(dictionary_name)
	

def get_next_line(f):
	""" Get the next line ignoring the comments """
	while True:
		line = f.readline()
		if not line.startswith('#'):
			line = line.rstrip('\r\n')
			return line
	
	
if __name__ == '__main__':
	
	dictionary_name = get_next_line(sys.stdin)
	check_index(dictionary_name)
	number_of_words = int(get_next_line(sys.stdin))
	
	# Index/cache in memory used for lookup
	index = {}	
	
	for i in range(number_of_words):
		word = get_next_line(sys.stdin)
		
		if not len(word) in index:
			# Read the index file of the specified length if it exists
			partial_index_filename = get_index_filename(dictionary_name, len(word))
			if os.path.exists(partial_index_filename):
				f = open(partial_index_filename, "rb")
				index[len(word)] = marshal.load(f)
				f.close()
			else:
				index[len(word)] = {}
		
		key = get_key(word)
		suggerences = [ x for x in index[len(word)].get(key, []) if x != word ]
		
		print "%s -> %s" % (word, " ".join(suggerences))
		
	
