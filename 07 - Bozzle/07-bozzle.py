#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Tuenti Challenge 3
#
# Challenge 7 - Boozzle

# C-3PO: "Exciting" is hardly the word I would choose.

import sys
from collections import defaultdict

dictionary = [{}, False]

def load_dictionary(dictionary):
    ''' Loads the dictionary in a tree. Each node is a list:
        - The first element is a map, the key is a letter and the value is another node
        - The second element indicates if in this node ends a valid dictionary word
    '''
    with open('boozzle-dict.txt', 'r') as f:
        for word in f:
            word = word.rstrip('\r\n ')
            
            d = dictionary
            
            for c in word:
                letter_table = d[0]
                d = letter_table.get(c, None)         
                if d is None:
                    d = [{}, False]
                    letter_table[c] = d                
                    
            d[1] = True
                    
                    
def search_word(dictionary, board, score, width, height, all_words, word, pos, CM, WM, visited, time_left):
    ''' Searches all the words possible from the position. Stores all the words and their scores in all_words
    '''
    
    if time_left <= 0:
        return
    
    if len(dictionary[0]) == 0:
        return
        
    cell = board[(pos)]    
    
    d = dictionary[0].get(cell[0], None)
    if d is None:
        return
        
    new_word = word + cell[0]
    new_CM = CM + [cell[1]]
    new_WM = WM + [cell[2]]
        
    if d[1] == True:
        # Calculate the score of the whole word
        points = 0
        for i in range(len(new_word)):
            points += score[new_word[i]] * new_CM[i]
            
        points *= max(new_WM)
        points += len(new_word)
        
        # If there are multiple path for the same word, store always the maximum
        old_points = all_words.get(new_word, 0)
        if old_points < points:
            all_words[new_word] = points

    if len(d[0]) == 0:
        # There are no more possible word
        return
    
    # Searches in all directions
    for inc in [(0, 1), (1, 0), (0, -1), (-1, 0), (1, 1), (1, -1), (-1, 1), (-1, -1)]:
        npx = pos[0] + inc[0]
        if npx < 0 or npx == width:
            continue
            
        npy = pos[1] + inc[1]
        if npy < 0 or npy == height:
            continue
            
        new_pos = (npx, npy)
        if new_pos in visited:
            continue
            
        search_word(d, board, score, width, height, all_words, new_word, new_pos, new_CM, new_WM, visited + [(pos)], time_left - 1)


def knapsack(all_words, W):
    
    if W <= 0:
        return 0
        
    c = defaultdict(int)
    v = []
    w = []
    
    for word in all_words:
        v.append(all_words[word])
        w.append(len(word) + 1)
        
    n = len(v)
    for i in range(0, n):
        for j in range(0, W + 1):
            if w[i] > j:
                c[(i, j)] = c[(i - 1, j)]
            else:
                c[(i, j)] = max(c[(i - 1, j)], v[i] + c[(i - 1, j - w[i])])
            
    
    return c[(n - 1, W)]
    


if __name__ == '__main__':
    load_dictionary(dictionary)
    
    num_cases = int(sys.stdin.readline())
    
    for num_case in range(num_cases):
        score = eval(sys.stdin.readline())
        duration = int(sys.stdin.readline())
        height = int(sys.stdin.readline())
        width = int(sys.stdin.readline())
        board = {}
        
        for y in range(height):
            for elem in enumerate(sys.stdin.readline().rstrip('\r\n ').split()):
                CM = 1
                WM = 1
                if int(elem[1][1]) == 1:
                    CM = int(elem[1][2])
                else:
                    WM = int(elem[1][2])
                    
                board[(elem[0], y)] = (elem[1][0], CM, WM)
    
        all_words = {}
        for x in range(width):
            for y in range(height):
                search_word(dictionary, board, score, width, height, all_words, "", (x,y), [], [], [(x,y)], duration - 1)
        
    
        print knapsack(all_words, duration)
                
