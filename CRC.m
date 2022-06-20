function CRC(whichModel)

clc;
lengthOfSignal = 16;
packageSize = 4;

% Generowanie sygnalu
signal = randi([0,1],1,lengthOfSignal);
fprintf("Signal:\n");
for i=1:length(signal)
    fprintf('%d ', signal(i));
    if mod(i,packageSize) == 0
        fprintf('  ');
    end
end
fprintf("\n");
% Kodowanie sygnalu
encoded = [];
for i=1:packageSize:lengthOfSignal-packageSize+1
    encodedSignal = CRCCoder(signal(i:i+packageSize-1));
    encoded = [encoded encodedSignal];
end
fprintf("Encoded:\n");
for i=1:length(encoded)
    fprintf('%d ', encoded(i));
    if mod(i,packageSize+32) == 0
        fprintf('\n');
    end
end
fprintf("\n");


corrupted = transmitSignal(encoded, whichModel);

packageWithError = 0;
for i=1:packageSize+32:length(corrupted)-32+1
    [decoded, errorCount] = CRCDecoder(corrupted(1:packageSize+32));
    packageWithError = packageWithError + errorCount;
end
fprintf("Corrupted:\n");
for i=1:length(corrupted)
    fprintf('%d ', corrupted(i));
end
fprintf("\n");

fprintf("Decoded:\n");
for i=1:length(decoded)
    fprintf('%d ', decoded(i));
    if mod(i,packageSize) == 0
        fprintf('  ');
    end
end
fprintf("\n");


%  fprintf("Error Count = %d\n", errorCount);

% Wyniki
[allErrors] = biterr(encoded, corrupted);
fprintf("Bledy w corrupted = %f\n", allErrors);
%[undetectedErrors] = biterr(signal, decoded);
%fprintf("Bledy w decoded = %f\n", undetectedErrors);
fprintf("Bledy wykryto w %d pakietach z %d\n", packageWithError, ceil(lengthOfSignal/packageSize));
fprintf("Skutecznosc: %f%%\n", packageWithError/ceil(lengthOfSignal/packageSize)*100);
%encodedBER = allErrors/length(encoded)*100;
%fprintf("BER dla encoded-corrupted = %f%%\n", encodedBER);
%decodedBER = undetectedErrors/length(decoded)*100;
%fprintf("BER dla decoded-signal = %f%%\n", decodedBER);

end 