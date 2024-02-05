function DF_F= DF2F(A,Ref,showfigures)


Means = mean(A(Ref,:));
DF_F = (A-Means)./Means;
% Maxium = max(DF_F);
% AUCs = sum(DF_F);
% Mean_AUC = mean(AUCs);
if showfigures
figure
plot(A)
legend("raw data")

figure
plot(DF_F)
legend("dF/F")
end
