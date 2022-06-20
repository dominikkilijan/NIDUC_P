clc;

signal = [1 1 1 0 1 0 0 1 1 0];

fprintf("Signal:\n");
for i=1:length(signal)
    fprintf('%d ', signal(i));
end
fprintf("\n");


encoded = CRCCoder(signal);
fprintf("Encoded:\n");
for i=1:length(encoded)
    fprintf('%d ', encoded(i));
end
fprintf("\n");


decoded = CRCDecoder(encoded);

fprintf("Decoded:\n");
for i=1:length(decoded)
    fprintf('%d ', decoded(i));
end
fprintf("\n");