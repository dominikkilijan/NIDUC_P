function [corrupted] = BSCChannel(signal, errorProbability)
%BSCChannel Funkcja generujaca zaklocenia w sygnale
%   errorProbability - prawdopodobienstwo zmiany wartosci bitu na przeciwna
%   signal - zakodowany sygnal 
corrupted = bsc(signal, errorProbability);

end