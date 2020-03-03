clc; clear all; close all;
grayscale=[0 1 2 3 4 5 6 7];
S_min=0; S_max=7;        %range till where pixel values have to be stretched
temp=[]; index_temp=[]; I=[];
corr_pix=[0 0 5 20 20 19 0 0];       %number of pixels originally
for i=1:8
    if corr_pix(i)~=0
        t=corr_pix(i);
        index_temp=[index_temp i];
        temp=[temp t];
        I=[I grayscale(i)];
    end
end

I_min=grayscale(index_temp(1));
I_max=grayscale(index_temp(end));
S=[]; 

for i=1:length(I)
    s=round((((S_max-S_min)/(I_max-I_min))*(I(i)-I_min))+S_min);
    S=[S s];
end

new_I=[];
for i=1:length(grayscale)
    a=grayscale(i);
    tf=isempty(find(S==a));
    if tf==1
        new_I=[new_I 999];
    else
        b=find(S==a);
        new_I=[new_I I(b)];
    end
end

op=[];    
for i=1:length(new_I)
    if new_I(i)==999
        op=[op 0];
    else 
        c=new_I(i);
        d=find(grayscale==c);
        op=[op corr_pix(d)];
    end
end
        
        
