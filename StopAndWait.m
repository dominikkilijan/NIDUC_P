function [corruptedSignal, decodedSignal, numberOfResends] = stopAndWait(signal, packageSize, whichModel)
%STOPANDWAIT Protokol Stop-And-Wait
%   signal - sygnal do przeslania
%   packageSize - ile bitow miesci sie w jednym pakiecie
%   whichModel - 1. Model BSC 2. Model Gilberta
%   corruptedSignal - caly sygnal z bledami
%   decodedSignal - caly odkodowany sygnal
%   numberOfResends - ile razy nalezalo ponownie wyslac pakiet, takze ile
%   razy zostal wykryty blad
maxRepeats = 10;
numberOfResends = 0;

corruptedSignal = [];
decodedSignal = [];
corrupted = [];
while ~isempty(signal)
    % Przejscie przez kanal transmisyjny
    if whichModel == 1
        corrupted = BSCChannel(signal(1:packageSize+1));
    end
    fprintf("Corrupted:\t");
    for i=1:length(corrupted)
    fprintf('%d ', corrupted(i));
    end
    fprintf("\n");
    
    % Dekodowanie pakietu
    [decoded, errorCount] = parityBitDecoder(corrupted(1:packageSize+1), packageSize);
    %fprintf("Error Count = %d\n", errorCount);
    if errorCount == 0 % ACK
        fprintf("Ok\n");
        corruptedSignal = [corruptedSignal corrupted];
        decodedSignal = [decodedSignal decoded];
        signal(1:packageSize+1) = []; % Usuwanie wyslanego pakietu
        maxRepeats = 10;
    else
        if maxRepeats == 0 
            fprintf('Zbyt duzo prob wyslania\n');
            return
        else
            fprintf("Wyslij jeszcze raz\n");
            maxRepeats = maxRepeats - 1;
            numberOfResends = numberOfResends + 1;
        end
    end
end
end