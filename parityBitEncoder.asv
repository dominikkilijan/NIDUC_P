function [encodedSignal] = parityBitEncoder(signal,packageSize)
%PARITY_BIT_ENCODER Koder bitu parzystosci
%   Bit parzystosci zostaje dodany co k bitow (na koniec kazdej czesci)
%   packageSize - ilosc bitow w czesci
%   encodedSignal - zakodowany sygnal
    signalLength = length(signal);
    encodedSignal = [];
    numberOfOnes = 0;
    for i = 1: signalLength
        encodedSignal = [encodedSignal signal(i)];
        numberOfOnes = numberOfOnes + signal(i);
        if mod(i,packageSize) == 0
            encodedSignal =[encodedSignal mod(numberOfOnes,2)];
            numberOfOnes = 0;
        end
    end
    if mod(signalLength,packageSize) > 0
        encodedSignal =[encodedSignal mod(numberOfOnes,2)];
    end
end