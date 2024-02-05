function [DF_F,BL] = DF_F_advanced(A,showfigure,stepsize)
DF_F = zeros(size(A));

for i = 1:size(A,2)
    [yOut,BL] = BLCorrection(A(:,i),stepsize,showfigure);
    DF_F(:,i) = yOut./BL;
end