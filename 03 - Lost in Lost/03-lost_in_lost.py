#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Tuenti Challenge 3
#
# Challenge 3 - Lost in Lost

# .8<4>15.16<15>23.42<23

import sys
import re
from collections import defaultdict


if __name__ == '__main__':
    num_cases = int(sys.stdin.readline())
    
    splitter = re.compile(r'([^\.<>]+|[\.<>])')
    
    for num_case in range(num_cases):
        line = sys.stdin.readline().rstrip('\r\n ')
        tokens = splitter.findall(line)
        
        # List of tuples of (operator, scene)
        pairs = zip(tokens[0::2], tokens[1::2])
        
        # To translate from/to scene name <-> id
        id_to_scenes = {}
        scenes_to_id = {}
        
        # Fixed order scenes seen so far
        fixed_scenes = []
        
        # Each key is the id of a scene, and each value is a set of scene ids that have to be
        # BEFORE in the sequence than the key id
        before = defaultdict(set)
        after = defaultdict(set)
        incoming_edges = defaultdict(int)
        
        invalid = False
        
        for operator, scene in pairs:
            # Generate a new ID each time a new scene is read
            id = scenes_to_id.get(scene, None)
            
            if id is None:
                id = len(scenes_to_id)
                scenes_to_id[scene] = id
                id_to_scenes[id] = scene   

            if operator == '.':
                if len(fixed_scenes) > 0:
                    after[fixed_scenes[-1]].add(id)
                    before[id].add(fixed_scenes[-1])
                
                fixed_scenes.append(id)
                            
            elif operator == '<':
                if len(fixed_scenes) == 0:
                    invalid = True
                    break
                
                after[id].add(fixed_scenes[-1])
                before[fixed_scenes[-1]].add(id)

            elif operator == '>':
                if len(fixed_scenes) == 0:
                    invalid = True
                    break
                
                after[fixed_scenes[-1]].add(id)
                before[id].add(fixed_scenes[-1])
        
        if invalid:
            print "invalid"
            continue
               
        num_scenes = len(id_to_scenes)
        
        # Beggining scenes doesn't have entry in the "before" dictionary
        beggining_scenes = [ id for id in range(num_scenes) if id not in before ]
        
        if len(beggining_scenes) != 1:
            print "invalid"
            continue

        s = set( beggining_scenes )
        l = []
        
        copy_after = defaultdict(set)
        for key in after:
            copy_after[key] = set(after[key])
            
        copy_before = defaultdict(set)
        for key in before:
            copy_before[key] = set(before[key])
        
        while len(s) > 0:
            n = s.pop()
            l.append(n)
            
            for id in list(copy_after[n]):
                copy_after[n].discard(id)                    
                copy_before[id].discard(n)

                if len(copy_before[id]) == 0:
                    s.add(id)
        
        if any( [ len(copy_after[id]) != 0 for id in copy_after ] ) or any( [ len(copy_before[id]) != 0 for id in copy_before ]):
            print "invalid"
            continue
               
        multiple_orders = False
            
        for i in range(len(l) - 1):
            if not l[i + 1] in after[l[i]]:
                multiple_orders = True
                break
            
        if multiple_orders:
            print "valid"
        else:
            print ",".join([ id_to_scenes[id] for id in l ])
            
