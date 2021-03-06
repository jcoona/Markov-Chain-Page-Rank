function [ rankedPages ] = pagerank(nodes, indexlinks, sourcedest, damping)
%%This function runs the algorithm PageRank and determines an adjacency
%%matrix, steady state vector, and determines the outcome of best ranked
%%pages in the end.

adjacencyMatrix = GenerateMatrix(nodes, sourcedest);

%%The first thing we need to do is modify the adjacency matrix to account
%%for the damping factor.

transitionMatrix = adjacencyMatrix*damping + (1-damping)/nodes;
%%The new matrix will still have the Markov property that all columns sum
%%to 1, but with redistributed probability so the small sites have a
%%chance.

steadyState = MarkovChain(nodes, transitionMatrix);
%%This uses the transition matrix to find a steady state vector ranking the
%%probability that a monkey clicking on random links will end up at each
%%webpage at any given time.

pagesWithRanks = [num2cell(steadyState) indexlinks];
%%concatenate steady vector with original links so they may be sorted.

rankedPages = sortrows(pagesWithRanks,-1);
rankedPages(:,1)=[];


end


