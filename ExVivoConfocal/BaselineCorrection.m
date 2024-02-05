function li = BaselineCorrection(mee)
% baseline correction
startP = 1;
endP = length(mee);

% startP = 1100;
% endP = 1700;
% ---------------
li = mee;
slope = (li(startP)-li(endP))/(startP-endP);
li = li'-(1:length(li))*slope;
li = li'- li(1);
% figure
% plot(li)