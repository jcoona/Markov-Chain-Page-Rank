%% Main file
%% CSE3504 Project Part 2
%% Adam Claxton
%% Connor Jackson
%% See code below for stuff.

clc;
clear;

%%Load the hollins file into these variables.
[nodes, edges, indexlinks, sourcedest] = loadhollins('hollins.dat');
rankedpages = pagerank(nodes, indexlinks, sourcedest, 0.85);

