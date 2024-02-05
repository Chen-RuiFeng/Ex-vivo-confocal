% ---------------------------------------------------------------------
% Ruifeng Chen
% sa15008146@tamu.edu
% Dec/12/2021
%----------------------------------------------------------------------
folder = 'D:\Ex vivo confocal data\2024\01282024RC_D1Cre_Flex_Chrimson_gDA_gACh_DMS';
fileName = '01282024RC_D1Cre_Chrimson_S3C1_gACh__SubP_20Hz_SeriesAnalysis1_DATA_02.csv';
threshold = 0.20;
showfigure = 0;
stepsize = 120;
AUClens = 20;
BLlenght = 20;
fixed_channel = 1; % 0: no fixed channel; 1: data = T.Average_CH1; 2: data = T.Average_CH2;
% ---------------------------------------------------------------------
Paras = [threshold,stepsize];
[indx,data,mask,t] = excelReader([folder,'\',fileName],fixed_channel);
% ---------------------------------------------------------------------
close all
clc;
lens = length(t);
A = reshape(data,[lens,length(data)/lens]);
me = mean(A,2);
[msk,indexes] = mskGenerator(mask,lens,stepsize,threshold,showfigure);
me_mask = me.*msk;


figure
plot(me_mask)
hold on
for i = 1:length(indexes)
    me_mask_temp = me_mask(indexes(i)-BLlenght:indexes(i)+floor(AUClens/t(2)));
    me_mask_temp = (me_mask_temp-mean(me_mask_temp(1:BLlenght-5)))/mean(me_mask_temp(1:BLlenght-5));
    fwhm(i) = FWHM(me_mask_temp);
    temp = me_mask_temp(BLlenght:end);
    AUCs(i) = sum(temp(~isnan(temp)));
    [Peaks(i),delay(i)] = max(me_mask_temp);
    plot(indexes(i):indexes(i)+floor(AUClens/t(2)),me_mask(indexes(i):indexes(i)+floor(AUClens/t(2))),'r')
end
summary=[Peaks',delay'*t(2)-BLlenght*t(2),AUCs',fwhm'*t(2)];




