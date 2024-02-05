% -------------------------------------------------------------------------
% Ruifeng Chen
% sa15008146@tamu.edu
% Dec/12/2021
%--------------------------------------------------------------------------
folder = 'D:\Ex vivo confocal data\10292023_11042023YH_AD_Gi_Ctrl_gACh\10312023YH_gACh_DMS';
fileName = '10312023YH_gACh_DMS_Ctrl_S2C3_SeriesAnalysis1_DATA_01.csv';
threshold = 0.3;
showfigure = 0;
stepsize = 100;
fixed_channel = 0;
% -------------------------------------------------------------------------

close all;
Paras = [threshold,stepsize];
[indx,data,~,t] = excelReader([folder,'\',fileName],fixed_channel);

% close all
clc;
lens = length(t);
A = reshape(data,[lens,length(data)/lens]);

[DF_F,BL] = DF_F_advanced(A,showfigure,stepsize);
me = mean(DF_F,2);
figure("Name","AllMean")
findpeaks(me,'MinPeakProminence',threshold,'Annotate','extents');
[Pks, Locs, W, p] = findpeaks(mean(DF_F,2),'MinPeakProminence',threshold);
summary=[p,W*t(2)];
tms = [t,me,std(DF_F,1,2)/sqrt(size(DF_F,2))];
DF_F = DF_F';
% traces=[];
% for i = 1:length(Locs)
%     traces = [traces,mean_n_se(DF_F(:,Locs(i)-50:Locs(i)+50),1)];
% end






