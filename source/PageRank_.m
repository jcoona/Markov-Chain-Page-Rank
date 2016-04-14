function [ rankedPages ] = PageRank( Nodes, Edges, IndexLinks, SourceDest )
%
damping=.85 %the damping factor (will probably make a parameter later)
adjacencyMatrix = generateMatrix( 1:Nodes, SourceDest );

%%The first thing we need to do is modify the adjacency matrix to account
%%for the damping factor.

transitionMatrix = adjacencyMatrix*damping + (1-damping)/Nodes;
%%The new matrix will still have the Markov property that all collumns sum
%%to 1, but with redistributed probability so the small sites have a
%%chance.

stateVect = ones(1,Nodes)/Nodes;
%initialize state vector to give equal probability to all nodes

stateVect = mtimes(transitionMatrix,stateVect);


end

