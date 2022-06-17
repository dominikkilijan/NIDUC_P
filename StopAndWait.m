function [corruptedSignal, decodedSignal, countError] = StopAndWait(signal, packageSize)
%STOPANDWAIT Protokol Stop-And-Wait
%
countError = 0;
maxRepeats = 10;

corruptedSignal = [];
decodedSignal = [];

while ~isempty(signal)
    % Przejscie przez kanal transmisyjny
    corrupted = BSCChannel(signal(1:packageSize+1));
    fprintf("Corrupted:\n");
    for i=1:length(corrupted)
    fprintf('%d ', corrupted(i));
    end
    fprintf("\n");

    [decoded, errorCount] = parityBitDecoder(signal(1:packageSize+1), packageSize)
    if errorCount == 0 % ACK
        corruptedSignal = [corruptedSignal corrupted];
        decodedSignal = [decodedSignal decoded]
        signal(1:packageSize+1) = [] % Usuwanie wyslanego pakietu
        maxRepeats = 10;
    else
        if maxRepeats == 0 
            fprintf('Zbyt duzo prob wyslania\n');
            return
        else
            maxRepeats = maxRepeats - 1;
        end
    end
end
end