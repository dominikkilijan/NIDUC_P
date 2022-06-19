clc;

whichMethod = 1;
whichModel = 2;

switch whichMethod
    case 1
        parity(whichModel);
    case 2
        repetition(whichModel);
    case 3
        % wywolanie CRC
end