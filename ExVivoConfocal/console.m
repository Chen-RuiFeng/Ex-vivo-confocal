% -------------------------------------------------------------------------
% Ruifeng Chen
% sa15008146@tamu.edu
% Dec/12/2021
%--------------------------------------------------------------------------
folder = 'D:\Ex vivo confocal data\08042023_08112023RC_ChATCre_jGCaMP7f_DMS_';
fileName = '08042023RC_ChATCre_jGCaMP7f_DMS_S1C1_CIN_baseline_0001_SeriesAnalysis1_DATA_01.csv';
threshold = 0.01;
cent= 150;
% area = [cent-40,cent+85];
area = [cent-40,cent+220];
Ref = cent-45:cent-5;
showfigure = 1;
stepsize = 200;
OptSti = 0;
peakThreshold = 0.001;
% -------------------------------------------------------------------------
[data,mask,t] = excelReader([folder,'\',fileName]);
close all
clc;
lens = length(t);
A = reshape(data,[lens,length(data)/lens]);
% A = A(310:410,:);


msk = reshape(mask,[lens,length(mask)/lens]);
msk = mean(msk,2);
[mskY,mskBL] = BLCorrection(msk,stepsize,showfigure);
DF2F = mskY./mskBL;
[mskPks, mskLocs, mskW, mskp] = findpeaks(DF2F,'MinPeakProminence',peakThreshold,'Annotate','extents');
msk(msk>threshold)=NaN;
msk(msk<=threshold)=1;
msk(find(isnan(msk))+1) = NaN;
msk(find(isnan(msk))+1) = NaN;
msk(find(isnan(msk))+1) = NaN;
try
    msk = msk(eleSti:lens);
    msksub = msk(area(1):area(2));
catch
    msksub = ones(length(area(1):area(2)),1);
    disp("No mask applied")
end

figure("Name","MeanRawData")
plot(mean(A,2))

DF_F = zeros(size(A(area(1):area(2),:)));
for i = 1:size(A,2)
[yOut,BL] = BLCorrection(A(area(1):area(2),i),stepsize,showfigure);
DF_F(:,i) = yOut./BL;
end

me = mean(DF_F,2);
se = std(DF_F,0,2)/sqrt(size(DF_F,2));
tms = [];
tee = t(area(1):area(2));
tms = tee-tee(cent-area(1));
me = me.*msksub;
tms = [tms,me];
tms = [tms,se.*msksub];

figure("Name","mean")
plot(me)
fwhtms = FWHM(me)*t(2);
MAXms = max(me);
lit = me(~isnan(me));
AUCms = sum(lit(lit>0));
Summary = [AUCms,MAXms,fwhtms];

if ~showfigure
    close all
end