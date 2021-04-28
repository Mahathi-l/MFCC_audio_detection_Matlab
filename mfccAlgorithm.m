function c = mfccAlgorithm(s, fs)
frameSize = 256;                        % frame size
frameDistance = 100;                        % inter frame distance
len = length(s);
numberOfFrames = 1 + floor((len - frameSize)/double(frameDistance));
frameVectors = zeros(frameSize, numberOfFrames); % vector of frame vectors

for i=1:numberOfFrames
    index = 100*(i-1) + 1;
    for j=1:frameSize
        frameVectors(j,i) = s(index);
        index = index + 1;
    end
end

hammingWindow = hamming(frameSize);              % hamming window
afterWinMat = diag(hammingWindow)*frameVectors;   
freqDomMat = fft(afterWinMat);  % FFT into freq domain

filterBankMat = melFilter(20, frameSize, fs);                % matrix for a mel-spaced filterbank
nby2 = 1 + floor(frameSize/2);
melSpectrum = filterBankMat*abs(freqDomMat(1:nby2,:)).^2; % mel spectrum
c = dct(log(melSpectrum));                                % mel-frequency cepstrum coefficients
c(1,:) = [];                                     % exclude 0'th order cepstral coefficient