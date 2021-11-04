function bit_seq = GenerateBits(N_bits)
%
% Inputs:
%   N_bits:     Number of bits in the sequence
% Outputs:
%   bit_seq:    The sequence of generated bits
%
% This function generates a sequence of bits with length equal to N_bits

% bit_seq = zeros(1,N_bits);  

%%% WRITE YOUR CODE HERE
bit_seq = randi([0, 1], 1, N_bits); % generate random integers within the interval [0, 1] (row vector)

% bit_seq = round(bit_seq + rand(N_bits)); % uncomment the initialization
% above if using bit_seq = zeros(1,N_bits)
%%%