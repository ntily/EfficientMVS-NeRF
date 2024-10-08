clear all
close all
format compact
clc

% script to calculate the statistics for each scan given this will currently only run if distances have been measured
% for all included scans (UsedSets)

MaxDist=20; %outlier thresshold of 20 mm

time=clock;time(4:5), drawnow

dataPaths = {'/home/nati/3Dreconstruction/Surface/RC-MVSNet-modified1/eval_out_data/fpn-mlp-bi-5views/'}
resultsPaths = {'/home/nati/3Dreconstruction/Surface/RC-MVSNet-modified1/dtu_eval_results/fpn-mlp-bi-5views/'}

light_string='l3'; % l3 is the setting with all lights on, l7 is randomly sampled between the 7 settings (index 0-6)
method_string = 'mvsnet'

UsedSets=GetUsedSets;

nStat=length(UsedSets);

BaseStat.nStl=zeros(1,nStat);
BaseStat.nData=zeros(1,nStat);
BaseStat.MeanStl=zeros(1,nStat);
BaseStat.MeanData=zeros(1,nStat);
BaseStat.VarStl=zeros(1,nStat);
BaseStat.VarData=zeros(1,nStat);
BaseStat.MedStl=zeros(1,nStat);
BaseStat.MedData=zeros(1,nStat);

for i=1:length(dataPaths)
    dataPath = dataPaths{i};
    resultsPath = resultsPaths{i};
    for cStat=1:length(UsedSets), %Data set number
        
        currentSet=UsedSets(cStat);
        
        %input results name
        % EvalName=[resultsPath method_string eval_string num2str(currentSet) '.mat']
        EvalName=[resultsPath sprintf('%s_%03d_%s.mat',lower(method_string),currentSet,light_string)]
        load(EvalName)
        
        Dstl=BaseEval.Dstl(BaseEval.StlAbovePlane); %use only points that are above the plane 
        Dstl=Dstl(Dstl<MaxDist); % discard outliers
        
        Ddata=BaseEval.Ddata(BaseEval.DataInMask); %use only points that within mask
        Ddata=Ddata(Ddata<MaxDist); % discard outliers
        
        BaseStat.nStl(cStat)=length(Dstl);
        BaseStat.nData(cStat)=length(Ddata);
        
        BaseStat.MeanStl(cStat)=mean(Dstl);
        BaseStat.MeanData(cStat)=mean(Ddata);
        
        BaseStat.VarStl(cStat)=var(Dstl);
        BaseStat.VarData(cStat)=var(Ddata);
        
        BaseStat.MedStl(cStat)=median(Dstl);
        BaseStat.MedData(cStat)=median(Ddata);
        
        time=clock;[time(4:5) currentSet cStat], drawnow
    end

    totalStatName=[resultsPath 'TotalStat_' method_string '.mat']
    save(totalStatName,'BaseStat','time','MaxDist');
end



