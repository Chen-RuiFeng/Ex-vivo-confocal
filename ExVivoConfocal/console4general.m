% -------------------------------------------------------------------------
% Ruifeng Chen
% sa15008146@tamu.edu
% Dec/12/2021
%--------------------------------------------------------------------------
folder = 'D:\Ex vivo confocal data\2024\01262024RC_D1Cre_Flex_Chrimson_gDA_gACh_DMS';
fileName = '01262024RC_D1Cre_Chrimson_S4C1_gDA_Bath_DHbE10uM_SeriesAnalysis1_DATA_01.csv';
threshold = 0.03;
showfigure = 1;
stepsize = 50;  
Ref =760:1377;
fixed_channel = 0;
% -------------------------------------------------------------------------
Paras = [threshold,stepsize];
[indx,data,mask,t] = excelReader([folder,'\',fileName],fixed_channel);

close all
clc;
lens = length(t);
A = reshape(data,[lens,length(data)/lens]);
DF_F= DF2F(A,Ref,showfigure);
tms = [t-t(Ref(end)),mean(DF_F,2),std(DF_F,1,2)/sqrt(size(DF_F,2))];
figure("Name","Mean DF_F")
plot(tms(:,1),mean(DF_F,2));