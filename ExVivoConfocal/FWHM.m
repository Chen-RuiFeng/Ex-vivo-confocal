% Full Width with Half Maximun
function fwhm = FWHM(Md)
K = find(Md>max(Md)/2);

fwhm = max(K)-min(K);