resultPath='/home/nati/3Dreconstruction/Surface/RC-MVSNet-modified1/dtu_eval_results/fpn-mlp-bi-5views/TotalStat_mvsnet.mat';
x=load(resultPath);
data=x.BaseStat;
comp=mean(data.MeanStl)
acc=mean(data.MeanData)
overall= (comp+acc)/2