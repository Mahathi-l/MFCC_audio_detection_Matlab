function y = wavrecord(n,Fs,ch,dtype)
if nargin < 3,ch = 1;dtype = 'uint8';end
if nargin < 4,
    if isa(ch,'char')
        dtype = ch;
        ch = 1;
    else 
        dtype='uint8'; 
    end; 
end
if nargin < 5,
    if isa(ch,'char')
        tmp = ch;
        ch = dtype;
        dtype = tmp;
    end;
end

if strcmp(dtype,'uint8')
    nbits = 8;
else
    nbits = 16;
end

recorder = audiorecorder(Fs,nbits,ch);
recordblocking(recorder,2);
y = getaudiodata(recorder,dtype);

return;
