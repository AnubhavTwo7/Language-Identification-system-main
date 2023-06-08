function frame=frames(y,size)
num=floor(length(y)/size); % number of frames

j=0;
frame=zeros(size,num);
for x=1:num
    
    frame(:,x)=y(j+1:j+size).*hamming(size);
    j=j+size;
end

end