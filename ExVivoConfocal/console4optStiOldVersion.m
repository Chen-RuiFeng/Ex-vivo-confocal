% console4stimulation
% Freq ValuesM ValueSE IntervalM IntervalSE
folder = 'D:\Ex vivo confocal data\10032023RC_A2ACre_Ai32_ChATeGFP_rACh_rDA_DMS';
fileName = '10032023RC_A2ACre_Ai32_S4C1_rDA_GABAaBlocker_20Hz_2_5_10_20p_SeriesAnalysis1_DATA_01.csv';

subend = 40;
stepsize = 200;
peakThreshold = 0.14;
needMask = 1;
showFigure = 1;
% -------------------------------------------------------------------------
close all
clc
[indx,data,mask,t] = excelReader([folder,'\',fileName]);
% -------------------------------------------------------------------------
timeDuration = t(end)-t(1);
SampleInter = t(2);
Paras = [stepsize,peakThreshold,area,timeDuration,SampleInter];
lens = length(t);
A = reshape(data,[lens,length(data)/lens]);
peakValues = {};
fwhms = {};
if needMask
    [msk,index] = mskGenerator(mask,lens,stepsize,0.05);
else
    msk = ones(size(timeDuration));
    msk = msk';
    disp("No mask applied")
end

for i = 1:size(A,2)
    
    [yOut,BL] = BLCorrection(A(:,i),stepsize,showFigure);
    dF_F = msk.*yOut./BL;
    % dF_F(:,i) = dF_F+0.3*i;
    [peakValues{i}, indexes] = findpeaks(dF_F,'MinPeakProminence',peakThreshold);
    % 
    fwhm = FWHM_advanced(indexes,dF_F,subend,showFigure);
    fwhms{i} = fwhm*SampleInter;
    if showFigure
        figure("name","peakdetected")
        plot(dF_F);
        hold on
        plot(indexes,peakValues{i},"or");
    end
end

summary = [meanCell(peakValues),meanCell(fwhms)];




function fwhm = FWHM_advanced(indexes,dF_F,subend,showFigure)
    fwhm = zeros(size(indexes));
    subarea = [indexes-10,indexes+subend];
    for ii = 1: length(indexes)
        fwhm(ii) = FWHM(dF_F(subarea(ii,1):subarea(ii,2)));
        if showFigure
            figure
            plot(dF_F(subarea(ii,1):subarea(ii,2)))
        end
    end
end