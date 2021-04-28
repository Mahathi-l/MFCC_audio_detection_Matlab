function wavplay(y,Fs,mode)

if nargin < 3,mode='sync';end

ap = audioplayer(y,Fs);

if strcmp(mode,'sync')
    %sync
    playblocking(ap);               % blocking
else
    %async
    global qcl_wavplay;             % using global variable, so, after
    qcl_wavplay = {qcl_wavplay ap}; % this function ended, the audio will
    play(ap);                       % continue to play.
end

