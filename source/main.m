%% Main file
%% CSE3504 Project Part 2
%% Adam Claxton
%% Connor Jackson
%% See code below for stuff.

clc;
clear;

%%Load the hollins file into these variables.
[nodes, edges, indexlinks, sourcedest] = loadhollins('hollins.dat');
rankedpages1 = pagerank(nodes, indexlinks, sourcedest, 0.85);
rankedpages2 = pagerank(nodes, indexlinks, sourcedest, 0.95);
rankedpages3 = pagerank(nodes, indexlinks, sourcedest, 0.50);

