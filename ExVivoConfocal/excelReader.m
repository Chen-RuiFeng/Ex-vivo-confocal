% excelReader
% fileName = 'D:\Ex vivo confocal data\05252023RC_D1_tdT_5xFAD_mPFC_Chri...
% mison_gACh4m_DMS\05252023RC_S1C4_D1_tdT_5xFAD_mPFC_Chrimison_gACh4m_DMS...
% _Random_0001_SeriesAnalysis1_DATA_01.csv';
function [indx,data,mask,t] = excelReader(fileName,fixed_channel)
T = readtable(fileName);
if fixed_channel == 0
    if mean(T.Average_CH1)>mean(T.Average_CH2)
        data = T.Average_CH1;
        mask = T.Average_CH2;
    else
        data = T.Average_CH2;
        mask = T.Average_CH1;
    end
elseif fixed_channel==1
        data = T.Average_CH1;
        mask = T.Average_CH2;
elseif fixed_channel==2
        data = T.Average_CH2;
        mask = T.Average_CH1;
end
ind=find(T.Time==0);
if length(ind) ==1
    t = T.Time;
else
    t = T.Time(1:ind(2)-1);
end
indx = T.ROIID;