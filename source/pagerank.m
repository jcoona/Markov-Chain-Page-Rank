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

stateVect = ones(Nodes,1)/Nodes;
%initialize state vector to give equal probability to all nodes

lastState=zeros(Nodes,1);
%%Now we will begin our journey down the Markov chain, and attempt to find
%%the steady state vector by running until it is unchanged.
fprintf('Finding state vectors\n');
i=0;
while(lastState ~= stateVect)
    lastState=stateVect;
    stateVect = mtimes(transitionMatrix,stateVect);
    i=i+1;
end
fprintf('steady after %d iterations\n',i);

end

