#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Tuenti Challenge 3
#
# Challenge 5 - Dungeon Quest

# Gnomes plan:
#
# Phase 1 - Collect gems (or underpants)
# Phase 2 - ?
# Phase 3 - Profit

import sys

# 0 - No restriction
# 1 - Can't go up
# 2 - Can't go right
# 3 - Can't go down
# 4 - Can't go left

def get_reachable_gems(width, height, gems, pos_x, pos_y, restriction, seconds_left):
    ''' Returns:
        - A set of reachable_gems: This contains all the gems that are reachable in the remaining time,
                                   each element is (value, x, y)
        
        - A sorted list of possible next gems: An ordered by distance list of the possible (at most 4) gems to be explored
                                               Each element is (distance, value, x, y, restriction)
                                               The distance takes in account the movement restriction
                                               
        - The maximum possible profit with the remaining gems
    '''
    reachable_gems = set()
    gems_dist = []
    
    tmp_gems = set()
    
    for gem in gems:
        gem_value = gem[0]
        gem_x = gem[1]
        gem_y = gem[2]
        
        dist = abs(gem_x - pos_x) + abs(gem_y - pos_y)
        if dist > seconds_left:
            continue
                
        restrictions = []
                
        # Trying restriction 1, entering from up to down
        if gem_y > 0:
            if (gem_x, gem_y - 1) in tmp_gems:
                reachable_gems.add((gem_value, gem_x, gem_y))
            elif gem_x == pos_x and gem_y == pos_y + 1 and restriction == 3:
                # We are just above the cell, and we can't go down because we
                # came from that cell. So ignore this
                pass
            elif pos_y > gem_y:
                pass
            else:
                penalty = 0
                if pos_y == gem_y:
                    penalty += 2
                elif restriction == 3 and gem_x == pos_x and gem_y > pos_y:
                    penalty += 2
        
                if dist + penalty <= seconds_left:
                    restrictions.append((1, dist + penalty))
            
        # Trying restriction 3, entering from down to up
        if gem_y < height - 1:
            if (gem_x, gem_y + 1) in tmp_gems:
                reachable_gems.add((gem_value, gem_x, gem_y))
            elif gem_x == pos_x and gem_y == pos_y - 1 and restriction == 1:
                # We are just down the cell, and we can't go up because we
                # came from that cell. So ignore this
                pass
            elif pos_y < gem_y:
                pass
            else:
                penalty = 0
                if pos_y == gem_y:
                    penalty += 2
                elif restriction == 1 and gem_x == pos_x and gem_y < pos_y:
                    penalty += 2
        
                if dist + penalty <= seconds_left:
                    restrictions.append((3, dist + penalty))

        # Trying restriction 2, entering from right to left
        if gem_x < width - 1:
            if (gem_x + 1, gem_y) in tmp_gems:
                reachable_gems.add((gem_value, gem_x, gem_y))
            elif gem_y == pos_y and gem_x == pos_x - 1 and restriction == 4:
                # We are just to the right of the cell, and we can't go left because we
                # came from that cell. So ignore this
                pass
            elif pos_x < gem_x:
                pass
            else:
                penalty = 0
                if pos_x == gem_x:
                    penalty += 2
                elif restriction == 4 and gem_y == pos_y and gem_x < pos_x:
                    penalty += 2
        
                if dist + penalty <= seconds_left:
                    restrictions.append((2, dist + penalty))

        # Trying restriction 4, entering from left to right
        if gem_x > 0:
            if (gem_x - 1, gem_y) in tmp_gems:
                reachable_gems.add((gem_value, gem_x, gem_y))
            elif gem_y == pos_y and gem_x == pos_x + 1 and restriction == 2:
                # We are just to the left of the cell, and we can't go right because we
                # came from that cell. So ignore this
                pass
            elif pos_x > gem_x:
                pass
            else:
                penalty = 0
                if pos_x == gem_x:
                    penalty += 2
                elif restriction == 2 and gem_y == pos_y and gem_x > pos_x:
                    penalty += 2
        
                if dist + penalty <= seconds_left:
                    restrictions.append((4, dist + penalty))

        if len(restrictions) == 0:
            continue
        
        reachable_gems.add((gem_value, gem_x, gem_y))
        tmp_gems.add((gem_x, gem_y))
        for rest, total_dist in restrictions:
            gems_dist.append((total_dist, gem_value, gem_x, gem_y, rest))
            
    gems_dist.sort()
    
    # We only need 4 choices, the closest ones
    closest_greater_y = 1000
    closest_greater_x = 1000
    closest_lower_y = -1
    closest_lower_x = -1
    
    cgy = None
    cly = None
    cgx = None
    clx = None
    
    
    gems_final = []
    
    for g in gems_dist:
        (g_d, g_v, g_x, g_y, g_r) = g
        if g_y > pos_y and g_y < closest_greater_y:
            closest_greater_y = g_y
            cgy = g
        elif g_y < pos_y and g_y > closest_lower_y:
            closest_lower_y = g_y
            cly = g
            
        if g_x > pos_x and g_x < closest_greater_x:
            closest_greater_x = g_x
            cgx = g
        elif g_x < pos_x and g_x > closest_lower_x:
            closest_lower_x = g_x
            clx = g
            
    gems_dist = sorted(set([ x for x in [cgy, cly, cgx, clx] if x is not None]))
    
    return reachable_gems, gems_dist, sum([-g[0] for g in reachable_gems])
            
        

def search_best_profit(width, height, reachable_gems, gems_dist, pos_x, pos_y, restriction, seconds_left, profit, path, maximum_possible_profit):
    global max_profit
    global max_path
    
    if seconds_left <= 0 or len(gems) == 0:
        return
        
    if maximum_possible_profit + profit <= max_profit:
        return
        
    for i in range(len(gems_dist)):
        gem_dist, gem_value, gem_x, gem_y, gem_restriction = gems_dist[i]
        
        if (gem_x, gem_y) in path:
            continue
        
        tmp_profit = profit - gem_value
        if tmp_profit > max_profit:
            max_path = path + [(gem_x, gem_y)]
        max_profit = max(tmp_profit, max_profit)
                
        copy_set = reachable_gems.copy()
        copy_set.discard((gem_value, gem_x, gem_y))
        new_reachable_gems, new_gems_dist, new_maximum_possible_profit = get_reachable_gems(width, height, copy_set, gem_x, gem_y, gem_restriction, seconds_left - gem_dist)
        search_best_profit(width, height, new_reachable_gems, new_gems_dist, gem_x, gem_y, gem_restriction, seconds_left - gem_dist, tmp_profit, path + [(gem_x, gem_y)], maximum_possible_profit - gem_dist)



max_profit = 0
max_path = []

if __name__ == '__main__':

    num_cases = int(sys.stdin.readline())
    
    for num_case in range(num_cases):
        max_profit = 0
        max_path = []
        width, height = [ int(x) for x in sys.stdin.readline().split(',') ]
        initial_x, initial_y = [ int(x) for x in sys.stdin.readline().split(',') ]
        seconds_left = int(sys.stdin.readline())
        gem_count = int(sys.stdin.readline())
        gems = []
        
        for (gem_x, gem_y, gem_value) in [ x.split(',') for x in sys.stdin.readline().split('#') ]:
            gems.append((-int(gem_value), int(gem_x), int(gem_y)))
                    
        reachable_gems, gems_dist, maximum_possible_profit = get_reachable_gems(width, height, gems, initial_x, initial_y, 0, seconds_left)
        
        search_best_profit(width, height, reachable_gems, gems_dist, initial_x, initial_y, 0, seconds_left, 0, [(initial_x, initial_y)], maximum_possible_profit)
        #print "max_path = ", max_path
        print max_profit

