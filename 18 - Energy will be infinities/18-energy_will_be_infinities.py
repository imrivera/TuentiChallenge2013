#!/usr/bin/env pypy
# -*- coding: utf-8 -*-

# Tuenti Challenge 3
#
# Challenge 18 - Energy will be infinities

# To infinity and beyond!

import sys

# First find the strongly connected components of the graph with Tarjan's algorithm
# and then apply the Bellman-Ford in each of the components to find positive cycles


class Vertex:
    def __init__(self, number = None):
        self.output_edges = set()
        self.number = number
        self.index = None
        
    def add_edge(self, w, cost):
        self.output_edges.add((w, cost))
        
    def __str__(self):
        return "<Vertex %s>" % (self.number)
        
    def __repr__(self):
        return "<Vertex %s>" % (self.number)

def tarjan(V):
    list_of_sets = []
    
    def strongconnect(v, index, S, set_S):
        v.index = index[0]
        v.lowlink = index[0]
        index[0] += 1
        S.append(v)
        set_S.add(v)
        
        for w, cost in v.output_edges:
            if w.index is None:
                strongconnect(w, index, S, set_S)
                v.lowlink = min(v.lowlink, w.lowlink)
            elif w in set_S:
                v.lowlink = min(v.lowlink, w.index)
                
        if v.lowlink == v.index:
            new_set = []
            while True:
                w = S.pop()
                set_S.discard(w)
                new_set.append(w)
                if w == v:
                    break
            new_set.reverse()
            list_of_sets.append(new_set)
                        
    S = []
    index = [0]
    
    for v in V:
        v.index = None
    
    for v in V:
        if v.index is None:
            strongconnect(v, index, S, set())
            
    return list_of_sets
    

def bellman_ford_find_cycle(V, edge_list, source):
    ''' Returns True is there is any negative cycle '''
    # Initialize distance to 1.0 because our weights are multiplied, not added

    for v in V:
        if v == source:
            v.distance = 1.0
        else:
            v.distance = None
            
        
    for i in xrange(len(V) - 1):
        for u, v, cost in edge_list:
            if u.distance is not None:         
                if (v.distance is None) or (u.distance * cost < v.distance):
                    v.distance = u.distance * cost
                    

    for u, v, cost in edge_list:
        if (v.distance is None) or (u.distance * cost < v.distance):
            return True

            
    return False
        
        
        
if __name__ == '__main__':
    sys.setrecursionlimit(50000)
    num_cases = int(sys.stdin.readline())
    
    for num_case in range(num_cases):

        #print "num_case = ", num_case
        number_vertices = int(sys.stdin.readline())
        number_edges = int(sys.stdin.readline())

        V = []

        for i in xrange(number_vertices):
            V.append(Vertex(i))
            
        for n in xrange(number_edges):
            id_source, id_dest, cost = [ int(x) for x in sys.stdin.readline().split() ]
            V[id_source].add_edge(V[id_dest], cost)

        # Look for a node without output edges, that will be an error
        buggy = False


        list_of_sets = tarjan(V)

        for scc in list_of_sets:
            # Check for infinite positive cycle in each component
            # Generate an edge list only for our component
            edge_list = []
            for v in scc:
                for w, cost in v.output_edges:                
                    if w in scc:
                        # Normally Bellman-Ford detects negative cycles
                        # Invert the cost to detect positive energy cycles
                        edge_list.append((v, w, 1.0 / (1.0 + (cost / 100.0) )))
                    
            buggy = bellman_ford_find_cycle(scc, edge_list, scc[0])
            if buggy:
                break
                    
        
        print buggy
        
        
