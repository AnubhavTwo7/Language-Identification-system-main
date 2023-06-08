%% Testing with GMM modelling
clear all;
clc;
a=dir('allcleanmodels_16/*.mat');
b=dir('feature_test/*');
confmat=zeros(length(a)); 

 for i=3:length(b)
     c=dir(fullfile('feature_test',b(i).name,'*.mat'));
        for j=1:length(c)
            load(fullfile('feature_test',b(i).name,c(j).name));
            d=zeros(length(a),1);
                for k=1:length(a)
                      load(fullfile('allcleanmodels_16',a(k).name));
                      if (isempty(feature)) 
                          continue; 
                      end
                       d(k)=mean(log(gmmprob(MIX,feature)));
                       clear MIX;
                end;
                d=d';
              ak=find(d==max(d));
              confmat(i-2,ak)=confmat(i-2,ak)+1;
            clear d y1;
          end; 
       end;
 
 
 s=0;
 for g=1:length(a)
     for h=1:length(b)
         if(g==h)
             s=s+confmat(g,h);
         end;
     end;
 end;

total=sum(sum(confmat));
percentage=(s/total)*100;
