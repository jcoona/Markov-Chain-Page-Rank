function makefile(dampingfactor, file, rankedpages)
fprintf('\nWriting file for damping factor %.2f\n', dampingfactor);
string = sprintf('  Node\tWebsite URL\n%6d\t%s', rankedpages{1,1}, rankedpages{1,2});
for i = 2:length(rankedpages)
   string = sprintf('%s\n%6d\t%s', string, rankedpages{i,1}, rankedpages{i,2}); 
end
fprintf(file, '%s', string);
fprintf('Finishing writing file.\n');
fclose(file);
end

