%%Training
clear all;

clc;
a=dir('feature_train');
mkdir('allcleanmodels_16');
addpath(genpath('FullBNT-1.0.4/'));
for i=3:length(a)



nmix = 64;           % In this case, we know the # of mixtures needed
final_niter = 30;
ds_factor = 1;


dim=9;
%dim=39; % for MFCC
centres=18;
MIX=gmm(dim,centres,'diag');
load(fullfile('feature_train',a(i).name));
foptions(14)=1;
MIX=gmminit(MIX,feature,foptions);
MIX.priors;
OPTIONS(1)=1;
OPTIONS(14)=85;
[MIX,OPTIONS,ERRLOG]=gmmem(MIX,feature,OPTIONS);




save(fullfile('allcleanmodels_16',a(i).name),'MIX');
clear y1 MIX;
end;


 
 
