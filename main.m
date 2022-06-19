clc;

whichMethod = 3;    % 1. Parity 2. Dublowanie 3. CRC
whichModel = 2;     % 1. Model BSC 2. Model Gilberta
timeElapsed = 0;
switch whichMethod
    case 1
        tic;
        parity(whichModel);
        timeElapsed = toc;
    case 2
        tic;
        repetition(whichModel);
        timeElapsed = toc;
    case 3
        tic;
        CRC(whichModel);
        timeElapsed = toc;
end
fprintf("Czas: %5.5f s\n", timeElapsed);