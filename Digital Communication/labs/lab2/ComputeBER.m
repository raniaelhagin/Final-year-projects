function BER = ComputeBER(bit_seq,rec_bit_seq)
%
% Inputs:
%   bit_seq:     The input bit sequence
%   rec_bit_seq: The output bit sequence
% Outputs:
%   BER:         Computed BER
%
% This function takes the input and output bit sequences and computes the
% BER

%%% WRITE YOUR CODE HERE
rec_bit_seq_sized = zeros(1, length(bit_seq));
if length(rec_bit_seq) < length(bit_seq)
    rec_bit_seq_sized(1:length(rec_bit_seq))= rec_bit_seq;
else
    rec_bit_seq_sized = rec_bit_seq(1:length(bit_seq));
end 
compared_mat = (bit_seq ~= rec_bit_seq_sized);
errors = sum(compared_mat);
BER = errors / length(compared_mat);
%%%
