clc;

whichMethod = 3;
whichModel = 1;

switch whichMethod
    case 1
        parity(whichModel);
    case 2
        repetition(whichModel);
    case 3
        signal = [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1];
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
end