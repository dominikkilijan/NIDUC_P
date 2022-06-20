function [encodedSignal] = CRCCoder(signal)
%CRCCODER Funkcja do kodowania w modelu CRC32
%   signal - sygnal do zakodowania
%   encodedSignal - zakodowany sygnal

poly = 'z^32 + z^26 + z^23 + z^22 + z^16 + z^12 + z^11 + z^10 + z^8 + z^7 + z^5 + z^4 + z^2 + z + 1';
crc32 = comm.CRCGenerator('Polynomial', poly);
signal = signal.';
encodedSignal = crc32(signal);
encodedSignal = encodedSignal.';

end 