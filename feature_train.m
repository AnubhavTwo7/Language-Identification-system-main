clear all;
clc;
x1=0;
a=dir('traindata/*');
mkdir('feature_train');
    
   for i=3:length(a)
       
      allwav=dir(fullfile('traindata',a(i).name,'*.wav'));
      
        for j=1:length(allwav)
            dest=[];
            fname=fullfile('traindata',a(i).name,allwav(j).name);
           
                  [y fs]=audioread(fname);
                   y=resample(y,8000,fs);
                   sig=y.*y;
          E=mean(sig);
          Threshold=0.05*E;
          k=1;
          for b=1:100:(length(sig)-100)
              if((sum(sig(b:b+100)))/100 > Threshold)
                  dest(k:k+100)=y(b:b+100);
                  k=k+100;
               end;
          end;
          clear  FS Threshold E sig y ;
	              
                   dest=dest';
	              
                   if j==1
                       x1=dest;
                   else
                      x1=vertcat(x1,dest);
                   end;
        clear dest;
        end;
        
%                 wavwrite(x1,16000,fname)
%                  clear fname;
         f0=find_f0(x1,fs);
         g=struct;
         g.fs=fs;
         g.s=x1;
         g.t=0:1/fs:(length(x1)-1)/fs;
        feature=glott_time(g,f0);
          %glot=gvv(x1);
          %hrf=h_richness(x1,fs);
          %H1_H2=h_diff(x1,fs);
%        feature=mfcc_rasta_delta_pkm_v1(glot,8000,13,26,25,10,1,1,2);
         %feature=cat(2,hrf,H1_H2);

%          [sffcepfeats, del, ddel] = sffCesptra(x1,fs,20,0,512,0,13);
%          y1=sffcepfeats';
         save(fullfile('feature_train',a(i).name),'feature');
        clear hrf H1_H2 feature x1;
        
   end;
   
