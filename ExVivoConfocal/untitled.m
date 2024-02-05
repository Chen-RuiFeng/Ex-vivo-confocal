DT = DF_F(1:1000,:);

temp = zeros(size(DT));

% figure
% for i = 1:size(DT,2)
%     temp(:,i) = DT(:,i)+i*0.3;
%     plot(temp(:,i))
%     hold on
% end
peakValues = {};
indexes ={};
amps = zeros(size(DF,2),2);
freq = zeros(size(DF,2),2);
[yOut,BL] = BLCorrection(DT,120,0);
for i = 1:size(DF,2)
    temp = yOut(:,i);
    [peakValues{i}, indexes{i}] = findpeaks(temp,'MinPeakProminence',0.05);
    amps(i,1) = mean(peakValues{i}(indexes{i}<500));
    amps(i,2) = mean(peakValues{i}(indexes{i}>500));
    freq(i,1) = sum(indexes{i}<500);
    freq(i,2) = sum(indexes{i}>500);

    figure
    plot(yOut(:,i))
    hold on
    plot( indexes{i},peakValues{i},'or')
end

