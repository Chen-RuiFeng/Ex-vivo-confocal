function indList = indxCleaner(indx)
   indxlist = unique(indx);
   indList = zeros(size(indxlist));
   for i = 1:length(indxlist)
        indList(i) = str2num(indxlist{i}(1:end-1));
   end
end