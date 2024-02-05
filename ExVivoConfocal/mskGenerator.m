% mskGenerator
function [msk,indexes] = mskGenerator(mask,lens,stepsize,threshold,showfigure)
    msk = reshape(mask,[lens,length(mask)/lens]);
    msk = mean(msk,2);
    [yOut,BL] = BLCorrection(msk,stepsize,showfigure);
    msk = yOut./BL;
    [~, indexes] = findpeaks(msk,'MinPeakProminence',threshold);
    msk(msk>threshold)=NaN;
    msk(msk<=threshold)=1;
%     msk(find(isnan(msk))+1) = NaN;
    for i = 1:length(indexes)
        area = msk(indexes(i)-10:indexes(i)+10);
        area = find(isnan(area));
        indexes(i) = indexes(i)-11+area(1);
    end
    figure
    plot(msk)
    hold on
    plot(indexes,ones(size(indexes)),'or')
end