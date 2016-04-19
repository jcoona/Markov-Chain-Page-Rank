%% Main file
%% CSE3504 Project Part 2
%% Adam Claxton
%% Connor Jackson
%% See code below for stuff.

clc;
clear;

%%Load the hollins file into these variables.
fprintf('Loading hollins data.\n')
[nodes, edges, indexlinks, sourcedest] = loadhollins('hollins.dat');
fprintf('\nBeginning the PageRank for damping factor 0.85.\n');
rankedpages1 = pagerank(nodes, indexlinks, sourcedest, 0.85);
fprintf('\nBeginning the PageRank for damping factor 0.95.\n');
rankedpages2 = pagerank(nodes, indexlinks, sourcedest, 0.95);
fprintf('\nBeginning the PageRank for damping factor 0.50.\n');
rankedpages3 = pagerank(nodes, indexlinks, sourcedest, 0.50);

file1 = fopen('file1.txt', 'w');
file2 = fopen('file2.txt', 'w');
file3 = fopen('file3.txt', 'w');

makefile(0.85, file1, rankedpages1);
makefile(0.95, file2, rankedpages2);
makefile(0.50, file3, rankedpages3);




