function [corrupted] = BSCChannel(signal)
%BSCChannel Funkcja generujaca zaklocenia w sygnale
%   signal - sygnal poddawany zakloceniom
%   corrupted - sygnal po zakloceniu
errorProbability = 0.3;
corrupted = bsc(signal, errorProbability);

end