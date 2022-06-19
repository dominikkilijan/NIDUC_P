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

% Kodowanie sygnalu
fprintf("\n");
encoded = CRCCoder(signal);
fprintf("Encoded:\n");
for i=1:length(encoded)
    fprintf('%d ', encoded(i));
end
fprintf("\n");

% Zaklocanie i dekodowanie
[corrupted, decoded, numberOfResends] = StopAndWait(encoded, packageSize, whichModel, 2);

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

%  corrupted = BSCChannel(encoded);
%      fprintf("Corrupted:\n");
%      for i=1:length(corrupted)
%      fprintf('%d ', corrupted(i));
%      end
%      fprintf("\n");
%  
% % Dekodowanie sygnalu
% [decoded,errorCount] = CRCDecoder(corrupted);
% fprintf("Encoded:\n");
%  for i=1:length(decoded)
%      fprintf('%d ', decoded(i));
%      if mod(i,packageSize) == 0
%          fprintf('  ');
%      end
%  end
%  fprintf("\n");
%  fprintf("Error Count = %d\n", errorCount);

% Wyniki
fprintf("Liczba ponownych przesylow pakietow = %f\n", numberOfResends);
[allErrors] = biterr(encoded, corrupted);
fprintf("Niewykryte bledy w corrupted = %f\n", allErrors);
[undetectedErrors] = biterr(signal, decoded);
fprintf("Niewykryte bledy w decoded = %f\n", undetectedErrors);
encodedBER = allErrors/length(encoded)*100;
fprintf("BER dla encoded-corrupted = %f%%\n", encodedBER);
decodedBER = undetectedErrors/length(decoded)*100;
fprintf("BER dla decoded-signal = %f%%\n", decodedBER);

end