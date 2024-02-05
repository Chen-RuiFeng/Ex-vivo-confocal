max(GI(:,2))
max(mC(:,2))
mC2 = 0.2327*mC(:,2)/0.1814;
mC1= mC(:,1);

smc = [mC1,mC2];
smc = smc(261:361,:);

sgi = GI(261:361,:);

z = fspecial('gaussian', [101,1], 20);
figure
plot(z)

figure
hold on
plot(smc(:,1),smc(:,2),'y')
plot(sgi(:,1),sgi(:,2)+z,'k')
sgi(:,2) = sgi(:,2)+z;

figure
hold on 

plot(GI(:,1),GI(:,2))
plot(mC1,mC2)


