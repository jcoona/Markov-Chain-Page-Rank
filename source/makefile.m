function makefile(dampingfactor, file, rankedpages)
%%This function will take a set of data and add it all to a text file. 

fprintf('\nWriting file for damping factor %.2f\n', dampingfactor);

%%This function implements sprintf and basically makes a really long string
%%and adds it to a text file.
string = sprintf('  Node\tWebsite URL\n%6d\t%s', rankedpages{1,1}, rankedpages{1,2});
%%iterate all the rows and add them additionally
for i = 2:length(rankedpages)
   string = sprintf('%s\n%6d\t%s', string, rankedpages{i,1}, rankedpages{i,2}); 
end
%%add to file
fprintf(file, '%s', string);
fprintf('Finishing writing file.\n');
fclose(file);
end

