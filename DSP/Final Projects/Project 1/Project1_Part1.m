%% Part 1 (Frequency Domain)
clear 
clc

%Generate a double tone sinusoidal signal (f1<4kHz and f2 > 4kHz) with a
% sampling frequency of 16 kHz.

f1 = randi(4000); % generate random f1 < 4kHz 
f2 = randi(4000)+ 4000; % generate random f2 > 4KHz 

Fs = 16000; % sampling frequency 
time_duration = 1;
t  = linspace(0, 1, Fs*time_duration);
signal = sin(2*pi*f1*t) + sin(2*pi*f2*t);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Apply Fourier Transform to the signal in step “1” and sketch its spectrum 
% and spectral density.
SIGNAL = fftshift(fft(signal)); % apply fourier transform 
f_vec = linspace(-Fs/2, Fs/2, length(signal));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Apply a 3rd order LPF whose cut-off frequency is 4 kHz to the signal in 
% step “1” and sketch the spectrum of the output. Compare the spectrum 
% with that in “2”. Comment
N = 3; % order of the digital LPF
fc = 4000; % cut-off frequency 
fn = Fs / 2; % normalized factor

Wn = fc / fn; 
coeff=fir1(N, Wn); % generate coefficients 
[H, W] = freqz(coeff, 1, 512); 
% H: n-point frequency respons vector 
% W: the corresponding angular frequency vector

filtered_sig = filter(coeff, 1, signal);
FILTERED_SIG = fftshift(fft(filtered_sig));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input a voice signal to MATLAB (using any available method) for a 
% duration of 5 seconds.
[y, Fs_audio] = audioread('eric.wav'); %input audio file 
[m,n] = size(y); % get size of the audio signal 

Ts_audio = 1/Fs_audio;
t_audio = Ts_audio*(0:m-1); %(0:m-1): samples

% crop audio for a duration of 5 seconds 
y_5sec = y(t_audio<5);
t_5sec = t_audio(t_audio<5);

sound(y_5sec, Fs_audio);
pause(5)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Repeat steps “2” on the voice signal.

% apply fourier transform on the audio signal 
AUDIO_SIG = fftshift(fft(y_5sec)); % apply fourier transform 
f_vec_audio = linspace(-Fs_audio/2, Fs_audio/2, length(y_5sec));

% apply the LPF on the adio signal 
y_filtered = filter(coeff, 1, y_5sec);
FILTERED_AUDIO = fftshift(fft(y_filtered));
sound(y_filtered, Fs_audio)
%% plotting the double tone sinusoidal signal 
figure('Name', 'plotting the double tone sinusoidal signal information'); 

% plotting the signal in time domain  
subplot(3,2,1)
plot(t, signal)
title('The Original Signal in Time Domain')
xlabel('t (s)')
ylabel('signal(t)')

% plotting the filtered signal in time domain
subplot(3,2,2)
plot(t, (filtered_sig))
title('The filtered signal in time domain')
xlabel('t (s)')
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


%% plotting the audio signal 
figure('Name', 'plotting the audio signal information');

% plotting the audio signal in time domain  
subplot(3,2,1)
plot(t_5sec,y_5sec)
title('The audio Signal in Time Domain')
xlabel('t (s)')
ylabel('signal(t)')

% plotting the filtered audio signal in time domain
subplot(3,2,2)
plot(t_5sec, (y_filtered))
title('The filtered audio signal in time domain')
xlabel('t (s)')
ylabel('filtered_audio_sig(t)')

% plotting the spectrum of the audio signal  
subplot(3,2,3)
plot(f_vec_audio, abs(AUDIO_SIG))
title('Spctrum of the audio signal')
xlabel('f(Hz)')
ylabel('AUDIO SIGNAL(f)')

% plotting the spectrum of the filtered audio signal  
subplot(3,2,4)
plot(f_vec_audio, abs(FILTERED_AUDIO))
title('Spctrum of the filtered audio signal')
xlabel('f (Hz)')
ylabel('FILTERED_AUDIO_SIG(f)')

% plotting the PSD of the audio signal  
subplot(3,2,5)
plot(f_vec_audio, abs(AUDIO_SIG).^2)
title('PSD of the audio signal')
xlabel('f (Hz)')
ylabel('PSD of AUDIO SIGNAL')

% plotting the LPF response   
subplot(3,2,6)
plot(W/pi, abs(H))
title('LPF Response')
xlabel('W')
ylabel('H(W)')

