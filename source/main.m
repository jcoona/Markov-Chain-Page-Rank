%% Main file
%% CSE3504 Project Part 2
%% Adam Claxton
%% Connor Jackson
%% This project will implement Google's PageRank algorithm on a sampling
%% of data. The end product will be three text files, displaying the data 
%% gathered from different damping effects of the PageRank algorithm.

clc;
clear;

%%Load the hollins file into these variables.
fprintf('Loading hollins data.\n')
[nodes, edges, indexlinks, sourcedest] = loadhollins('hollins.dat');

%%Solve the PageRanks for the three different damping factors
fprintf('\nBeginning the PageRank for damping factor 0.85.\n');
rankedpages85 = pagerank(nodes, indexlinks, sourcedest, 0.85);
fprintf('\nBeginning the PageRank for damping factor 0.95.\n');
rankedpages95 = pagerank(nodes, indexlinks, sourcedest, 0.95);
fprintf('\nBeginning the PageRank for damping factor 0.50.\n');
rankedpages50 = pagerank(nodes, indexlinks, sourcedest, 0.50);

%%initiate some files
file85 = fopen('damping85.txt', 'w');
file95 = fopen('damping95.txt', 'w');
file50 = fopen('damping50.txt', 'w');

%%write the PageRank results to the text files!
makefile(0.85, file85, rankedpages85);
makefile(0.95, file95, rankedpages95);
makefile(0.50, file50, rankedpages50);

fprintf('\nAll done!\n');




