clc; clear all; close all;
grayscale=input('enter grayscale value array');    %[0 1 2 3 4 5 6 7];
%range till where pixel values have to be stretched
S_min=input('enter minimum stretched pixel value');    %0; 
S_max=input('enter maximum stretched pixel value');  %7;        
temp=[]; index_temp=[]; I=[];

%number of pixels originally
corr_pix=input('enter corresponding number of pixels');   %[0 0 5 20 20 19 0 0];       
for i=1:length(grayscale)
    if corr_pix(i)~=0
        t=corr_pix(i);
        index_temp=[index_temp i];
        temp=[temp t];
        I=[I grayscale(i)];
    end
end

I_min=grayscale(index_temp(1));  %minimum value in array
I_max=grayscale(index_temp(end));   %maximum value in array
S=[]; 

for i=1:length(I)
    %round off the modified value
    s=round((((S_max-S_min)/(I_max-I_min))*(I(i)-I_min))+S_min);
    S=[S s];
end

new_I=[];
for i=1:length(grayscale)
    a=grayscale(i);
    tf=isempty(find(S==a));
    if tf==1
        new_I=[new_I 999];   %append with any large value
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
        op=[op corr_pix(d)];   %final stretched value
    end
end
        
        
