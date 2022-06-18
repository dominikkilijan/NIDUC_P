function [encodedSignal] = repetitionEncoder(signal,numberOfRepetitions)
%PARITY_BIT_ENCODER Koder bitu parzystosci
%   Bit parzystosci zostaje dodany co k bitow (na koniec kazdej czesci)
%   numberOfRepetitions - ile powtorzen bitu
%   encodedSignal - zakodowany sygnal
    signalLength = length(signal);
    encodedSignal = [];
    for i = 1: signalLength
        for j = 1:numberOfRepetitions
            encodedSignal = [encodedSignal signal(i)];
        end
    end
end