function pmatrix = pagerank(nodes, edges, indexlinks, sourcedest)
%This function will run the page rank algorithm on an input of page
%information.

%make nxn matrix n = nodes
pmatrix = zeros(nodes, nodes);
fprintf('Solving pmatrix now.');
for i = 1:nodes
    for j = 1:nodes
        %check to see if the pair exists in the source destination matrix
        [matrixmember, index] = ismember([j i], sourcedest, 'rows');
        %if it is
        if matrixmember == 1
            %count number of times j shows up in the source column
            outgoinglinks = sum(sourcedest(:,1) == j);
            %put into matrix
            pmatrix(i,j) = 1/outgoinglinks;
        end
    end
    fprintf('%d\n',i);
end

end

