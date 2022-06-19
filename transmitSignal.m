function [corrupted] = transmitSignal(signal, whichModel)
%TRANSMITSIGNAL Funkcja wybierajaca odpowiedni model transmisyjny
%   signal - sygnal do transmisji
%   whichModel - 1. Model BSC 2. Model Gilberta
%   corrupted - sygnal z bledami

corrupted = [];

if whichModel == 1
    corrupted = BSCChannel(signal);
elseif whichModel == 2
    corrupted = gilbertChannel(signal);
else
    printf("Nieprawidlowa wartosc whichModel!\n");
end