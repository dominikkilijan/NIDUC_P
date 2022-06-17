clc;

errorProbabilityBSC = 0.5;
% Generowanie sygnalu
lengSig = 16;
packageSize = 4;
signal = randi([0,1],1,lengSig);
fprintf("Signal:\n");
for i=1:length(signal)
    fprintf('%d ', signal(i));
    if mod(i,packageSize) == 0
        fprintf('  ');
    end
end

% Kodowanie sygnalu
fprintf("\n");
encoded = parityBitEncoder(signal, packageSize);
fprintf("Encoded:\n");
for i=1:length(encoded)
    fprintf('%d ', encoded(i));
end
fprintf("\n");


% Dekodowanie sygnalu
[decoded,errorCount] = parityBitDecoder(corrupted, packageSize);
fprintf("Encoded:\n");
for i=1:length(decoded)
    fprintf('%d ', decoded(i));
    if mod(i,packageSize) == 0
        fprintf('  ');
    end
end
fprintf("\n");
fprintf("Error Count = %d\n", errorCount);

[allErrors, ErrorPercent] = biterr(encoded, corrupted);
fprintf("Skutecznosc = %f%%\n", errorCount/allErrors*100);

