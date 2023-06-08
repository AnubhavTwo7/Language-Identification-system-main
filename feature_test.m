%to extract the mfcc features of the testingdata after removing silence
clear all;
clc;

a=dir('testdata/*');

for i=3:length(a)
    allwav=dir(fullfile('testdata',a(i).name,'*.wav'));

    for j=1:length(allwav)
        dest=[];
        fname=fullfile('testdata',a(i).name,allwav(j).name);
        [y,fs]=audioread(fname);
        y=resample(y,8000,fs);
        sig=y.*y;
        E=mean(sig);
        Threshold=0.05*E;
        k=1;
        for b=1:1000:(length(sig)-1000)
            if((sum(sig(b:b+1000)))/1000 > Threshold)
                dest(k:k+1000)=y(b:b+1000);
                k=k+1000;
            end;
        end;
        dest=dest';
        clear Threshold E sig y ;

%         size(dest);
         f0=find_f0(dest,fs);
         g=struct;
         g.fs=fs;
         g.s=dest;
         g.t=0:1/fs/(length(dest)-1)/fs;
        feature=glott_time(g,f0);
%          glot=gvv(dest);
%          hrf=h_richness(dest,fs);
%          H1_H2=h_diff(dest,fs);
%          feature=cat(2,hrf,H1_H2);
%feature=mfcc_rasta_delta_pkm_v1(glot,8000,13,26,25,10,1,1,2);
        %          [sffcepfeats, del, ddel] = sffCesptra(dest,fs,20,0,512,5*fs/1000,13);
        %          y1=sffcepfeats';

        mkdir(fullfile('feature_test',a(i).name));
        save(fullfile('feature_test',a(i).name, regexprep(allwav(j).name, '.wav', '')),'feature');
        clear feature dest fname fname1 ;
    end;
end;
