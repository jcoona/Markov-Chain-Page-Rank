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

fprintf('Writing file')
file = fopen('file.txt', 'w');
string = sprintf('%d %s', rankedpages1{1,1}, rankedpages1{1,2});
for i = 2:length(rankedpages1)
   string = sprintf('%s\n%d %s', string, rankedpages1{i,1}, rankedpages1{i,2}); 
end
fprintf(file, '%s', string);




