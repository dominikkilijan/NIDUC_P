function [decodedSignal] = repetitionDecoder(signal,numberOfRepetitions)
%PARITY_BIT_ENCODER Koder bitu parzystosci
%   Bit parzystosci zostaje dodany co k bitow (na koniec kazdej czesci)
%   numberOfRepetitions - ile powtorzen bitu
%   decodedSignal - zdekodowany sygnal
    signalLength = length(signal);
    decodedSignal = [];
    bitValue = 0;
    
    for i=1:numberOfRepetitions:signalLength-numberOfRepetitions+1
        %fprintf("i = %d\n", i);
        for j=i:numberOfRepetitions+i-1
            %fprintf("j = %d\n", j);
            bitValue = bitValue + signal(j);
        end
        bitValue = round(bitValue / numberOfRepetitions);
        %fprintf("bitValue = %d\n", bitValue);
        decodedSignal = [decodedSignal bitValue];
        bitValue = 0;
    end
end