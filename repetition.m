function repetition(whichModel)
clc;

lengSig = 16;
numberOfRepetitions = 3;

% Generowanie sygnalu
signal = randi([0,1],1,lengSig);
fprintf("Signal:\n");
for i=1:length(signal)
    fprintf('%d ', signal(i));
end
fprintf("\n");

% Kodowanie sygnalu
encoded = repetitionEncoder(signal, numberOfRepetitions);
fprintf("Encoded:\n");
for i=1:length(encoded)
    fprintf('%d ', encoded(i));
    if mod(i,numberOfRepetitions) == 0
        fprintf("\n");
    end
end
fprintf("\n");

% Przejscie przez kanal transmisyjny
if whichModel == 1
    corrupted = BSCChannel(encoded);
end
fprintf("Corrupted:\n");
for i=1:length(corrupted)
    fprintf('%d ', corrupted(i));
    if mod(i,numberOfRepetitions) == 0
        fprintf("\n");
    end
end
fprintf("\n");

% Dekodowanie sygnalu
decoded = repetitionDecoder(corrupted, numberOfRepetitions);
fprintf("Decoded:\n");
for i=1:length(decoded)
    fprintf('%d ', decoded(i));
end
fprintf("\n");

% Wyniki
[allErrors] = biterr(encoded, corrupted);
fprintf("Niewykryte bledy w corrupted = %f\n", allErrors);
[undetectedErrors] = biterr(signal, decoded);
fprintf("Niewykryte bledy w decoded = %f\n", undetectedErrors);
encodedBER = allErrors/length(encoded)*100;
fprintf("BER dla encoded-corrupted = %f%%\n", encodedBER);
decodedBER = undetectedErrors/length(decoded)*100;
fprintf("BER dla decoded-signal = %f%%\n", decodedBER);

end