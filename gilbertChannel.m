function [corrupted] = gilbertChannel(signal)
%GILBERTCHANNEL Funkcja generujaca zaklocenia w sygnale na podstawie modelu
%   Gilberta-Elliota
%   signal - sygnal poddawany zakloceniom
%   corrupted - sygnal po zakloceniu

state = 0;      % 0 - stan dobry, 1 - stan zly
p_dz = 0.15;    % prawdopodobienstwo przejscia dobry -> zly
p_zd = 0.45;     % prawdopodobienstwo przejscia zly -> dobry
signalLength = length(signal);
corrupted = [];

for i=1:signalLength
    randomNumber = randi([1,1000])/1000;
    if state == 0   % jesli jestesmy w stanie dobrym
        
        if randomNumber < p_dz % jesli tak to przechodzimy do stanu zlego
            state = 1;
            corrupted = [corrupted ~signal(i)];
        else                   % jesli nei to zostajemy w dobrym 
            corrupted = [corrupted signal(i)];
        end    
    else            % jesli jestesmy w stanie zlym
        if randomNumber < p_zd % jesli tak to wracamy do stanu dobrego
            state = 0;
            corrupted = [corrupted signal(i)];
        else                   % jesli nie to zostajemy w zlym
            corrupted = [corrupted ~signal(i)];
        end
    end
end