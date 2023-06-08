clear all;
clc;
allspk=dir('lid/*');
for i=3:length(allspk)
    str=allspk(i).name;
    mkdir(fullfile('traindata',str));
    mkdir(fullfile('testdata',str));
    wavall=dir(fullfile('lid',allspk(i).name,'*.wav'));
    for j=1:90   
        copyfile((fullfile('lid',allspk(i).name,wavall(j).name)),(fullfile('traindata',str,sprintf('%d.wav',j))));
    end
        for j=91:100
         copyfile((fullfile('lid',allspk(i).name,wavall(j).name)),(fullfile('testdata',str,sprintf('%d.wav',j))));   
        end
        
end
