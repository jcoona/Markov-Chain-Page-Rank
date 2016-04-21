function makefile(dampingfactor, file, rankedpages)
%%This function will take a set of data and add it all to a text file. 

fprintf('\nWriting file for damping factor %.2f\n', dampingfactor);

%%This function implements sprintf and basically makes a really long string
%%and adds it to a text file. Commas added to tab over a column
string = sprintf('Node,Website URL\n%6d,%s', rankedpages{1,1}, rankedpages{1,2});
%%iterate all the rows and add them additionally
for i = 2:length(rankedpages)
   string = sprintf('%s\n%6d,%s', string, rankedpages{i,1}, rankedpages{i,2}); 
end
%%add to file
fprintf(file, '%s', string);
fprintf('Finishing writing file.\n');
fclose(file);
end

