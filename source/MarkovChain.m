function [ steadyState ] = MarkovChain( Nodes, transitionMatrix )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
errorMargin = .0000001;
stateVect = ones(Nodes,1)/Nodes;
%initialize state vector to give equal probability to all nodes

lastState=zeros(Nodes,1);
%%Now we will begin our journey down the Markov chain, and attempt to find
%%the steady state vector. We iteratively recalculate it by multiplying it 
%%against the transition matrix, until every element changes by less than
%%the margin of error between steps.

fprintf('Finding state vectors\n');
i=0;
while(~closeEnough(lastState,stateVect,errorMargin))
    lastState=stateVect;
    stateVect = mtimes(transitionMatrix,stateVect);
    i=i+1;
end
fprintf('steady after %d iterations\n',i);

steadyState=stateVect;
end

function [aboutEqual] = closeEnough(one, two, errorMargin)
aboutEqual=false;
if length(one) == length(two)
    aboutEqual=true;
    for i = 1:length(one)
        if abs(one(i)-two(i)) > errorMargin
            aboutEqual=false;
            break;
        end
    end
end
end