function stateVect = MarkovChain(nodes, transitionMatrix)
%%This function generates a steady state vector.

errorMargin = .0000001;
stateVect = ones(nodes,1)/nodes;
%initialize state vector to give equal probability to all nodes

lastState=zeros(nodes,1);
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
fprintf('Steady after %d iterations\n',i);
end

function [aboutEqual] = closeEnough(prevstate, currentstate, errorMargin)
%%Checks to see if we need to continue calculating the next state vector.
aboutEqual=false;
if length(prevstate) == length(currentstate)
    aboutEqual=true;
    for i = 1:length(prevstate)
        if abs(prevstate(i)-currentstate(i)) > errorMargin
            aboutEqual=false;
            break;
        end
    end
end
end