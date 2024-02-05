% ---------------------------------------------------------------------
% Ruifeng Chen
% sa15008146@tamu.edu
% Dec/12/2021
%----------------------------------------------------------------------
folder = 'D:\Ex vivo confocal data\2024\01282024RC_D1Cre_Flex_Chrimson_gDA_gACh_DMS';
fileName = '01282024RC_D1Cre_Chrimson_S3C1_gACh__SubP_20Hz_SeriesAnalysis1_DATA_02.csv';
threshold = 0.02;
showfigure = 1;
stepsize = 100;
AUClens = 20;
fixed_channel = 0; % 0: no fixed channel; 1: data = T.Average_CH1; 2: data = T.Average_CH2;
% ---------------------------------------------------------------------
Paras = [threshold,stepsize];
[indx,data,mask,t] = excelReader([folder,'\',fileName],fixed_channel);
% ---------------------------------------------------------------------
close all
clc;
lens = length(t);
A = reshape(data,[lens,length(data)/lens]);

DF_F = DF_F_advanced(A,showfigure,stepsize);
[msk,indexes] = mskGenerator(mask,lens,stepsize,threshold,showfigure);
me = mean(DF_F,2);
stdd = std(DF_F,1,2)./sqrt(size(DF_F,2));  
me_mask = me.*msk;
tms = [t,me,stdd];

sampletrace= [];
samplestd = [];
figure
plot(me_mask)
hold on
for i = 1:length(indexes)
    me_mask_temp = me_mask(indexes(i):indexes(i)+AUClens);
    sampletrace(i,:) = me_mask(indexes(i)-40:indexes(i)+40);
    samplestd(i,:) = stdd(indexes(i)-40:indexes(i)+40);
    AUCs(i) = sum(me_mask_temp(me_mask_temp>0));
    [Peaks(i),delay(i)] = max(me_mask_temp(me_mask_temp>0));
    plot(indexes(i):indexes(i)+AUClens,me_mask(indexes(i):indexes(i)+AUClens),'r')
end
summary=[Peaks',delay'*t(2),AUCs'];

figure
plot(mean(sampletrace))
t_sample = t(1:101);
sampletrace = sampletrace';

% ---------------------------------------------------------------------
% figure("Name","AllMean")
% findpeaks(me(msk==1),'MinPeakProminence',threshold,'Annotate','extents');
% [Pks, Locs, W, p] = findpeaks(me(msk==1),'MinPeakProminence',threshold);
% 
% tms = [t.*msk,mean(DF_F,2).*msk,std(DF_F,1,2)/sqrt(size(DF_F,2))];
% 
% sums = zeros(length(Pks),1);
% lens = 100;
% figure
% plot(me)
% hold on
% for i = 1:length(Locs)
%     indTemp = find(me==Pks(i));
%     sums(i) = sum(me(indTemp:indTemp+lens));
%     plot(indTemp:indTemp+lens,me(indTemp:indTemp+lens),'r')
% end
% % peak; HW; AUC
% summary=[p,W*t(2),sums];

% ---------------------------------------------------------------------
% D1group = 1:9;
% D1indx = ismember(indxCleaner(indx),D1group);
% 
% D1me = mean(DF_F(:,D1indx),2);
% figure("Name","AllMean")
% findpeaks(D1me,'MinPeakProminence',threshold,'Annotate','extents');
% [Pks, Locs, W, p] = findpeaks(D1me,'MinPeakProminence',threshold);
% D1summary=[p,W*t(2)];
% 
% D2me = mean(DF_F(:,~D1indx),2);
% figure("Name","AllMean")
% findpeaks(D2me,'MinPeakProminence',threshold,'Annotate','extents');
% [Pks, Locs, W, p] = findpeaks(D2me,'MinPeakProminence',threshold);
% D2summary=[p,W*t(2)];
% ---------------------------------------------------------------------
