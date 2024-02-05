% -------------------------------------------------------------------------
% Ruifeng Chen
% sa15008146@tamu.edu
% Dec/12/2021
%--------------------------------------------------------------------------
folder = 'D:\Ex vivo confocal data\01202024RC_D1Cre_Flex_Chrimson_gDA_gACh_DMS';
fileName = '01202024RC_D1Cre_Chrimson_gDA_S2C1_ele_20Hz_2_5_10_20p_SeriesAnalysis1_DATA_01.csv';
threshold = 0.1;
showfigure = 1;
stepsize = 250;
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
% me = mean(DF_F,2);

summarys = [];
summarys_m = [];
for i = 1:size(DF_F,2)
    figure
    findpeaks(DF_F(:,i),'MinPeakProminence',threshold);
[Pks, Locs, W, p] = findpeaks(DF_F(:,i),'MinPeakProminence',threshold);
summarys_m = [summarys_m; length(p)/t(end),mean(p),mean(W*t(2))];
summarys = [summarys;ones(size(p))*i,p,W*t(2)];
end

% tms = [t,me,std(DF_F,1,2)/sqrt(size(DF_F,2))];
% DF_F = DF_F';
% traces=[];
% for i = 1:length(Locs)
%     traces = [traces,mean_n_se(DF_F(:,Locs(i)-50:Locs(i)+50),1)];
% end






