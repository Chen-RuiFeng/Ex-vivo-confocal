ax = [300,600,900,1200];
dff= {};
mee={};
see = {};
for i = 1:length(ax)
Atemp = A([ax(i)-20:ax(i)+50],:);
dff{i} = DF2F(Atemp,1:19,1);
mee{i} = mean(dff{i},2);
see{i} = std(dff{i},0,2)/sqrt(size(dff{i},2));
end