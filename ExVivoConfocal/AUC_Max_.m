
temp = DF_F(area(1):area(2),:);
lis = zeros(size(temp));
AUCs = zeros(1,size(temp,2));
MAXs = zeros(1,size(temp,2));
fwht = zeros(1,size(temp,2));
for i = 1:size(temp,2)
    lis(:,i) = BaselineCorrection(temp(:,i));
    tempp = lis(cent-area(1)+1:area(2)-area(1),i).*msksub(cent-area(1)+1:area(2)-area(1));
    figure
    plot(tempp)
    AUCs(i) = sum(tempp(tempp>0));
    MAXs(i) = max(tempp);
    fwht(i) = FWHT(tempp);   
end

fwht = fwht*t(2);

AUCms = [mean(AUCs),std(AUCs)/length(AUCs)];
MAXms = [mean(MAXs),std(MAXs)/length(MAXs)];
fwhtms = [mean(fwht),std(fwht)/length(fwht)];