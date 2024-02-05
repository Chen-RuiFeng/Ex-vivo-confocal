% BLCorrection_v0
% input = DF_F, startp, endp
function DF_F = BLCorrection_v0(DF_F, startp, endp)
ave = mean_n_se(DF_F',1);
slope = (ave(startp,1)-ave(endp,1))/(endp-startp);
slope = slope * (1:length(ave(:,1)));
ave(:,1) = ave(:,1)+slope';
ave(:,1) = ave(:,1)-ave(startp,1);
figure
plot(ave(:,1))

for i = 1: size(DF_F,2)
    DF_F(:,i) = DF_F(:,i)+slope';
    DF_F(:,i) = DF_F(:,i) - DF_F(startp,i);
end

