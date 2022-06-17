function [corrupted] = BSCChannel(signal)
%BSCChannel Funkcja generujaca zaklocenia w sygnale
%   errorProbability - prawdopodobienstwo zmiany wartosci bitu na przeciwna
%   signal - zakodowany sygnal 
errorProbability = 0.3;
corrupted = bsc(signal, errorProbability);

end