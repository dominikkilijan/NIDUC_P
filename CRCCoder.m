function [encoded_signal] = CRCCoder(signal)

poly = 'z^32 + z^26 + z^23 + z^22 + z^16 + z^12 + z^11 + z^10 + z^8 + z^7 + z^5 + z^4 + z^2 + z + 1';
crc32 = comm.CRCGenerator('Polynomial', poly);
signal = signal.';
encoded_signal = crc32(signal);
encoded_signal = encoded_signal.';
%disp(encoded_signal);
end