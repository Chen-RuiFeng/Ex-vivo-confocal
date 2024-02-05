  % data_alignment
% data
function interpVs = DataAlignment(data, duration)

interpVs = [];
for i= 1:2:size(data,2)
    x = data(:,i);
    x_ = x(x~=0);
    y = data(:,i+1);
    y = y(x~=0);
    interpVs =[interpVs;interp1(x_,y,duration)];
end

figure
plot(x_,y,"r")
hold on
plot(duration,interpVs(end,:),"K");