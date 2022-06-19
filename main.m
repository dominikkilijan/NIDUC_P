clc;

whichMethod = 2;
whichModel = 2;
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
        % wywolanie CRC
        timeElapsed = toc;
end
fprintf("Czas: %5.5f s\n", timeElapsed);