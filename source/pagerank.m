function [ rankedPages ] = PageRank( Nodes, Edges, IndexLinks, SourceDest )
%

damping = .85; %the damping factor (will probably make a parameter later)
adjacencyMatrix = GenerateMatrix( Nodes, SourceDest );

%%The first thing we need to do is modify the adjacency matrix to account
%%for the damping factor.

transitionMatrix = adjacencyMatrix*damping + (1-damping)/Nodes;
%%The new matrix will still have the Markov property that all collumns sum
%%to 1, but with redistributed probability so the small sites have a
%%chance.

steadyState = MarkovChain( Nodes, transitionMatrix );
%%Tihs uses the transition matrix to find a steady state vector ranking the
%%probability that a monkey clicking on random links will end up at each
%%webpage at any given time.

pagesWithRanks = [num2cell(steadyState) IndexLinks];
%%concatenate steady vector with original links so they may be sorted.

rankedPages = sortrows(pagesWithRanks,-1);
rankedPages(:,1)=[];


end


