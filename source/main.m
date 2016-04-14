%% Main file
%% CSE3504 Project Part 2
%% Adam Claxton
%% Connor Jackson
%% See code below for stuff.

clc;
clear;

%Open the file
fileID = fopen('hollins.dat');
%Translate into sloppy cell array; this makes a string cell array so we
%need to convert them to numbers later on.
cellarrayfile = textscan(fileID,'%s%s');
%reorganize so that it's actually reasonable to obtain data that we need.
col1 = cellarrayfile{1};
col2 = cellarrayfile{2};
cellfile = [col1 col2];

%Get nodes and edges
Nodes = str2num(cellfile{1,1});
Edges = str2num(cellfile{1,2});

%Form our data matrices separately
IndexLinks = cellfile(2:Nodes+1,:);
SourceDest = cellfile(Nodes+2:end,:);

%For ease we'll convert all the numbers from string to actual number
fprintf('Converting indices and links.\n');
for i = 1:length(IndexLinks)
    IndexLinks{i,1} = str2num(IndexLinks{i,1});
end
fprintf('Converting source and destination nodes.\n');
for i = 1:length(SourceDest)
    SourceDest{i,1} = str2num(SourceDest{i,1});
    SourceDest{i,2} = str2num(SourceDest{i,2});
end

SourceDest = cell2mat(SourceDest);

%%Just to display variables we care about up to this point.
clearvars cellarrayfile cellfile col1 col2 fileID i


