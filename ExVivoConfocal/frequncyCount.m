areaBL= 1:cent;
BL_t = t(areaBL(end)) - t(areaBL(1));
areaEX= cent:cent+1200;
EX_t = t(areaEX(end)) - t(areaEX(1));
peaksbase ={};
peaks = {};
close all;
me_data= [];
frq_BL = {};
frq_EX = {};
for i = 1:size(DF_F,2)
    temp = DF_F(:,i);
    [peakValues, indexes] = findpeaks(temp,'MinPeakProminence',0.03);
    figure
    plot(temp)
    hold on
    peaksbase{i} = peakValues(indexes<areaBL(end)&indexes>areaBL(1))-mean(temp(areaBL));
    frq_BL{i} = length(peaksbase{i})/BL_t;
    plot(indexes(indexes<areaBL(end)&indexes>areaBL(1)),peakValues(indexes<areaBL(end)&indexes>areaBL(1)),'og')
    
    me_data(i)=mean(temp(areaEX));
    peaks{i} = peakValues(indexes<areaEX(end)&indexes>areaEX(1))-me_data(i);
    frq_EX{i} = length(peaks{i})/EX_t;
    plot(indexes(indexes<areaEX(end)&indexes>areaEX(1)),peakValues(indexes<areaEX(end)&indexes>areaEX(1)),'or')
end
