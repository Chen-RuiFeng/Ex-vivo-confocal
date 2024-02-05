averageAll = zeros(4,1);
for i = 1:length(peakValues)
    averageAll = averageAll + peakValues{i};
end
averageAll = averageAll/length(peakValues);