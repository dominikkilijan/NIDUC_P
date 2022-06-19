function [decoded_signal, error] = CRCDecoder(signal)

signal_length = length(signal);
decoded_signal = signal(1:signal_length-32);
sum_copy = signal(signal_length-31:signal_length);
signal = CRCCoder(signal(1:signal_length - 32));
if sum_copy == signal(signal_length-31:signal_length)
    error = 0;
else 
    error = 1;
end

end