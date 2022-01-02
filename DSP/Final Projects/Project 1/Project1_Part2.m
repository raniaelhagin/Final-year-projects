%% Part 2 (Time Domain)
clear
clc 

% Generate a triple tone sinusoidal signal whose frequencies are 0.1, 2, 7 kHz 
% and a sampling frequency of 20 kHz and a duration of 0.1 seconds.

f1 = 100; 
f2 = 2000;
f3 = 7000;

Fs = 20000;
time_duration = 0.1; 
t  = linspace(0, 1, Fs*time_duration);

signal = sin(2*pi*f1*t) + sin(2*pi*f2*t) + sin(2*pi*t);
SIGNAL = fftshift(fft(signal));
f_vec = linspace(-Fs/2, Fs/2, length(signal));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{ 
Apply a LPF whose coefficients are given by
[1.0000 0.7303 0.5334 0.3895 0.2845 0.2077 0.1517 0.1108 0.0809 0.0591
0.0432 0.0315 0.023 0.0168 0.0123 0.009 0.0065 0.0048 0.0035 0.0026 0.0019
0.0014 0.001 0.0007] to the signal in step “1”. 
%}
coeff = [1.0000 0.7303 0.5334 0.3895 0.2845 0.2077 0.1517 0.1108 0.0809 0.0591 ...
    0.0432 0.0315 0.023 0.0168 0.0123 0.009 0.0065 0.0048 0.0035 0.0026 ...
    0.0019 0.0014 0.001 0.0007];

[H, W] = freqz(coeff, 1, 512); 
filtered_sig = filter(coeff, 1, signal);
FILTERED_SIG = fftshift(fft(filtered_sig));


%% Plotting 
figure('Name', 'plotting the triple tone sinusoidal signal information'); 

% plotting the signal in time domain  
subplot(3,2,1)
plot(t, signal)
title('The Original Signal in Time Domain')
xlabel('t(s)')
ylabel('signal(t)')

% plotting the filtered signal in time domain
subplot(3,2,2)
plot(t, filtered_sig)
title('The filtered signal in time domain')
xlabel('t(s)')
ylabel('filtered_sig(t)')

% plotting the spectrum of the original signal  
subplot(3,2,3)
plot(f_vec, abs(SIGNAL))
title('Spctrum of the original signal')
xlabel('f(Hz)')
ylabel('SIGNAL(f)')

% plotting the spectrum of the filtered signal  
subplot(3,2,4)
plot(f_vec, abs(FILTERED_SIG))
title('Spctrum of the filtered signal')
xlabel('f (Hz)')
ylabel('FILTERED_SIG(f)')

% plotting the PSD of the original signal  
subplot(3,2,5)
plot(f_vec, abs(SIGNAL).^2)
title('PSD of the original signal')
xlabel('f (Hz)')
ylabel('PSD of SIGNAL')

% plotting the LPF response   
subplot(3,2,6)
plot(W/pi, abs(H))
title('LPF Response')
xlabel('W')
ylabel('H(W)')


