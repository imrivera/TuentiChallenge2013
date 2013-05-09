#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Tuenti Challenge 3
#
# Challenge 6 - Ice Cave

# Eyes closed, we imagined our pain as a ball of white healing light
# floating around our feet and rising to our knees, our waist, our
# chest. Our chakras opening. The heart chakra. The head chakra.
# Chloe talked us into caves where we meet our power animal.
# Mine was a penguin.
#                                                 -- The Fight Club


import sys
import math
from collections import defaultdict

def search_line(cave_map, pos_x, pos_y, inc_x, inc_y, speed, rest_time):
    ''' Returns the position until the closest obstacle in the direction specified.
    
        Returns: - Cost of the path from the position to the destination (if no movemente is possible cost = 0)
                 - X coordinate of the new position
                 - Y coordinate of the new postion
    '''
    px = pos_x
    py = pos_y
    while True:
        px += inc_x
        py += inc_y
        c = cave_map[py][px]
        if c == '#':
            px -= inc_x
            py -= inc_y
            break
        elif c == 'O':
            break

    cost = 0
    if px != pos_x or py != pos_y:
        cost = float(abs(pos_x - px) + abs(pos_y - py)) / float(speed)
        cost += float(rest_time)
        
    return cost, px, py
            

def create_graph(cave_map, graph, weights, visited, pos_x, pos_y, speed, rest_time):
    visited.add((pos_x, pos_y))
    
    # Searches obstacles in the 4 possible directions
    for inc in [ (-1, 0), (1, 0), (0, 1), (0, -1) ]:
        cost, px, py = search_line(cave_map, pos_x, pos_y, inc[0], inc[1], speed, rest_time)
        if cost > 0:
                graph[(pos_x, pos_y)].add((px, py))
                weights[((pos_x, pos_y), (px, py))] = cost
                if cave_map[py][px] == 'O':
                    visited.add((px, py))
                else:
                    if (px, py) not in visited:
                        create_graph(cave_map, graph, weights, visited, px, py, speed, rest_time)
    

def dijkstra_search(cave_map, nodes, graph, weights, initial, end):
        dist = {}
        previous = {}
        
        for node in nodes:
            dist[node] = None
            previous[node] = None
        
        dist[initial] = 0
        all_nodes = nodes.copy()
        
        while len(all_nodes) > 0:
            min_dist = None
            u = None
            
            for node in all_nodes:
                if min_dist == None or ( dist[node] != None and dist[node] < min_dist):
                    u = node
                    min_dist = dist[node]
                    
            all_nodes.discard(u)
            if dist[u] == None:
                break
                
            if u == end:
                break
                
            for v in graph[u]:
                alt = dist[u] + weights[(u,v)]
                if dist[v] == None or alt < dist[v]:
                    dist[v] = alt
                    previous[v] = u
        
        # Iterate from the end to the beggining
        total_cost = 0
        u = end
        while u != initial:
            v = previous[u]
            total_cost += weights[(v, u)]
            u = v
            
        return int(math.ceil(total_cost))


if __name__ == '__main__':
    num_cases = int(sys.stdin.readline())
    
    for num_case in range(num_cases):
        width, height, speed, rest_time = [ int(x) for x in sys.stdin.readline().split() ]
        
        cave_map = []
        
        exit = None
        initial = None
                    
        for n in range(height):
            line = sys.stdin.readline().rstrip('\r\n').decode('utf-8')
            cave_map.append(line)
            i = cave_map[-1].find('O')
            if i != -1:
                exit = (i, n)
                
            i = cave_map[-1].find('X')
            if i != -1:
                initial = (i, n)
                            
        g = defaultdict(set)
        w = {}
        nodes = set([(initial)])
        create_graph(cave_map, g, w, nodes, initial[0], initial[1], speed, rest_time)
        
        print dijkstra_search(cave_map, nodes, g, w, initial, exit)
