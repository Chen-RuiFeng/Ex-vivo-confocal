% Y = A(:,2);
function [yOut,BL] = BLCorrection(Y,stepsize,showfigure)
X = 1:length(Y);
yOut = msbackadj(X',Y,"WindowSize",stepsize,"StepSize",stepsize);
BL = Y-yOut;
if showfigure
    figure
    plot(Y,'r')
    hold on
    plot(BL,'y')
end