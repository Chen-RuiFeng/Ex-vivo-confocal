Area = [1,2000];
Bath = [2000,4000];


Summary = [paracounter(Locs,p,W,t,Area),paracounter(Locs,p,W,t,Bath)];



function paraSummary = paracounter(Locs,p,W,t,Area)
    indxtemp = find(Locs<Area(2)&Locs>Area(1));
%     freq = length(indxtemp)/(t(Area(2)) - t(Area(1)));
%     meanAmp = mean(p(indxtemp));
%     meanHW = mean(W(indxtemp));
    paraSummary = [length(indxtemp)/(t(Area(2)) - t(Area(1)));...
        mean(p(indxtemp));mean(W(indxtemp)*t(2))];
end

