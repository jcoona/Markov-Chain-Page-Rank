%% Main file
%% CSE3504 Project Part 2
%% Adam Claxton
%% Connor Jackson
%% See code below for stuff.

clc;
clear;

%%Load the hollins file into these variables.
[Nodes, Edges, IndexLinks, SourceDest] = loadhollins('hollins.dat');
PageRank(Nodes, Edges, IndexLinks, SourceDest);

