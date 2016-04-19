function pmatrix = GenerateMatrix(nodes, sourcedest)
%This function will generate the initial adjacency matrix

%make nxn matrix n = nodes
pmatrix = zeros(nodes, nodes);
fprintf('Solving adjacency matrix now.\n');
for i = 1:length(sourcedest)
   %count number of times j shows up in the source column
   sourcenode = sourcedest(i,1);
   destnode = sourcedest(i,2);
   outgoinglinks = sum(sourcedest(:,1) == sourcenode);
   %put into matrix
   pmatrix(destnode,sourcenode) = 1/outgoinglinks;
end

end

