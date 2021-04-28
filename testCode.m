clc; 
close all; 
Fs=8000; 
Nseconds = 1;
k = 16;
code=load('code.mat');
code=code.code;

while(1)
fprintf('say Any immediately after hitting enter'); 
input(''); 
x= wavrecord(Nseconds*Fs,Fs,'double');
v = mfccAlgorithm(x, Fs);
distmin = inf;
k1 = 0;
for l = 1:length(code)      % each trained codebook, compute distortion
        d = distanceCalculated(v, code{l}); 
        dist = sum(min(d,[],2)) / size(d,1);      
        if dist < distmin
            distmin = dist;
            k1 = l;
        end      
end
disp(k1)
if(k1<=4)
    disp('Plastic')
    
elseif(k1<=8)
    disp('paper')
elseif(k1<=12)
    disp('wood')
	
	
   
else
    disp('non-plastic')
    
	
end 
end