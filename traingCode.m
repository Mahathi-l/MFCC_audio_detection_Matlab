clc; 
close all; 
clear all;
Fs=8000; 
Nseconds = 1;
samp=4;
k=16;
for i= 1:1:samp
    fprintf('Make plastic sound immediately after hitting enter'); 
    input(''); 
    x= wavrecord(Nseconds*Fs,Fs,'double');
    wavplay(x,Fs)
    v = mfccAlgorithm(x, Fs);
    code{i} = VectorQuantizationCodeBook(v, k);
    figure(1);
    plot(VectorQuantizationCodeBook(v, k));
    title('MFCC Features');
end
for i= (samp+1):1:2*samp 
    fprintf('Make paper sound immediately after hitting enter'); 
    input(''); 
    x= wavrecord(Nseconds*Fs,Fs,'double');
    wavplay(x,Fs)
    v = mfccAlgorithm(x, Fs);
    code{i} = VectorQuantizationCodeBook(v, k);
    figure(1);
    plot(VectorQuantizationCodeBook(v, k));
    title('MFCC Features');
end
for i= (2*samp+1):1:3*samp 
    fprintf('Make wood sound immediately after hitting enter'); 
    input(''); 
    x= wavrecord(Nseconds*Fs,Fs,'double');
    wavplay(x,Fs)
    v = mfccAlgorithm(x, Fs);
    code{i} = VectorQuantizationCodeBook(v, k);
    figure(1);
    plot(VectorQuantizationCodeBook(v, k));
    title('MFCC Features');
end
for i= (3*samp+1):1:4*samp 
    fprintf('Make metal sound immediately after hitting enter'); 
    input(''); 
    x= wavrecord(Nseconds*Fs,Fs,'double');
    wavplay(x,Fs)
    v = mfccAlgorithm(x, Fs);
    code{i} = VectorQuantizationCodeBook(v, k);
    figure(1);
    plot(VectorQuantizationCodeBook(v, k));
  
    title('MFCC Features');
end

save('code.mat','code')