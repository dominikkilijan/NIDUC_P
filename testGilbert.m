clc;

signal = [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
        corrupted = gilbertChannel(signal);
        fprintf("Signal:\n");
        for i=1:length(signal)
            fprintf('%d ', signal(i));
        end
        fprintf("\n");

        fprintf("Corrupted:\n");
        for i=1:length(corrupted)
            fprintf('%d ', corrupted(i));
        end
        fprintf("\n");
