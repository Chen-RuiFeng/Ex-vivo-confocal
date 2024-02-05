% calculate means for cell
function averageAll = meanCell(peakValues)
    averageAll = zeros(size(peakValues{1}));
    for i = 1:length(peakValues)
        averageAll = averageAll + peakValues{i};
    end
    averageAll = averageAll/length(peakValues);
end