function [ decodedSignal, errorCount ] = parityBitDecoder( signal, packageSize )
%PARITY_BIT_DECODER Dekoder sygnalu z bitem parzystosci
%   signal - sygnal wejsciowy
%   packageSize - dlugosc bitow w czesci
%   decodedSignal - odkodowany sygnal
%   errorCount - liczba wykrytych bledow

    signalLength = length(signal);
    decodedSignal = [];
    errorCount = 0;
    controlSum = 0;
    
    for i=1:signalLength-1
        if mod(i, packageSize+1) == 0
           if mod(controlSum, 2) ~= signal(i)
               errorCount = errorCount + 1;
           end
           controlSum = 0;
        else
           decodedSignal = [decodedSignal signal(i)];
           controlSum = controlSum + signal(i);
        end
    end
    if mod(controlSum, 2) ~= signal(signalLength)
        errorCount = errorCount + 1;
    end
end