clear 
clc 

%% Part 1:  Inter-Symbol Interference due to band-limited channels

% create a band-limited channel with a band B = 100 kHz
B = 1e5;                        % BW of the channel 
fs = 1e6;                       % Sampling frequency 
Ts = 1/fs;                      % Sampling time

N = 102400 - 1;                 % Total number of samples
t_axis = (-(N-1)/2:(N-1)/2)*Ts;            % Time axis 
f_axis = -fs/2:fs/N:fs/2-1/N;   % Frequency axis 


% Generate a square pulse in frequency domain  
y = sinc(2*B*t_axis);   % IFT of a rect is sinc 
Y = fftshift(fft(y));   % The square Pulse 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Generate the first square pulse of duration T = 2/B 
IN_SQ_PULSE_1 = (2/B)*sinc((2/B)*f_axis).*exp(-2*pi*1i*(1/B)*f_axis);
in_sq_pulse_1 = ifftshift(ifft(IN_SQ_PULSE_1));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% pass the first square pulse through the filter 
% output = conv(y, in_sq_pulse);
OUTPUT_1 = Y .* IN_SQ_PULSE_1;
output_1 = ifft(ifftshift(OUTPUT_1));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Generate the second square pulse of duration T = 2/B 
IN_SQ_PULSE_2 = (2/B)*sinc((2/B)*f_axis).*exp(-2*pi*1i*(3/B)*f_axis);
in_sq_pulse_2 = ifftshift(ifft(IN_SQ_PULSE_2));

% pass the second square pulse through the filter 
% output = conv(y, in_sq_pulse);
OUTPUT_2 = Y .* IN_SQ_PULSE_2;
output_2 = ifft(ifftshift(OUTPUT_2));
%% plotting

% Plotting the band-limited channel 
figure('Name', 'Band-limited channel')
subplot(2, 1, 1)
plot(t_axis, y)
title('Band-limitted channel in time domain')

subplot(2, 1, 2)
plot(f_axis, abs(Y))
title('Band-limited channel in frequency domain')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% plotting the input square pulse
figure('Name', 'The signal before and after the channel')

subplot(2, 2, 1)
plot(t_axis, abs(in_sq_pulse_1))
title('The signal in time domain before the channel')

subplot(2, 2, 3)
plot(f_axis, real(IN_SQ_PULSE_1))
title('The signal in frequency domain before the channel')

% plotting the filter output 
subplot(2, 2, 2)
plot(t_axis, real(output_1))
title('The signal in time domain after the channel')

subplot(2, 2, 4)
plot(f_axis, real(OUTPUT_1))
title('The signal in frequency domain after the channel')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% plotting the two pulses together 
figure('Name', 'Plot of the two pulses together before and after the channel')

subplot(2, 1, 1)
plot(t_axis, abs(in_sq_pulse_1), 'r', t_axis, abs(in_sq_pulse_2), 'b')
title('The signal in time domain before the channel')
legend('in sq pulse 1','in sq pulse 2')

% plotting the filter output 
subplot(2, 1, 2)
plot(t_axis, real(output_1), 'r', t_axis, real(output_2), 'b')
title('The signal in time domain after the channel')
legend('output 1','output 2')
