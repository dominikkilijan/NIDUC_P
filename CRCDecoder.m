function [decodedSignal, error] = CRCDecoder(signal)
%CRCDECODER Funkcja do dekodowania w modelu CRC32
%   signal - sygnal do zdekodowania
%   encodedSignal - zdekodowany sygnal

signalLength = length(signal);
decodedSignal = signal(1:signalLength-32);
sumCopy = signal(signalLength-31:signalLength);
signal = CRCCoder(signal(1:signalLength - 32));
if sumCopy == signal(signalLength-31:signalLength)
    error = 0;
else 
    error = 1;
end

end 