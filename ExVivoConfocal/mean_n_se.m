function MS = mean_n_se(matrx,dim)
MS = [mean(matrx,dim);std(matrx,1,dim)/sqrt(size(matrx,dim))];
MS = MS';
