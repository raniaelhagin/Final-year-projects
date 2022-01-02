Fs = 16000;                                            % Sampling Frequency
Ts = 1/Fs;                                              % Sampling Interval
t = linspace(0, 1, Fs);                                 % Time Vector (1 sec)
Fc = 4000;

S = cos(2*pi*t*3000)+cos(2*pi*t*6000);                            % 3kHz

Y = linspace(-Fs/2,Fs/2,length(S));
sfft = fftshift(fft(S));
sig = abs(sfft);
plot(Y,sig);
title('original Signal in frequency domain')
order = 3;
coeff=fir1(order,(Fc/(Fs/2)));
figure;
[H,F] = freqz(coeff,1,512);
plot(F,abs(H));
title('Response of the filter')

out = filter(coeff,1,S);
figure;
plot (t,abs(fftshift(fft(out))));
title('Filtered Signal in frequency domain')

%--------------------------------------------------------------------------

[data , Fs_audio] = audioread('eric.wav');
[data] = audioread('eric.wav',[1 5*Fs_audio]);
X_audio = fftshift(fft(data));
Y_audio = linspace(-Fs_audio/2,Fs_audio/2,length(data));
%sound (data,Fs_audio);
%Time vector
time = (1/Fs_audio)*length(data);
tvec = linspace(0, time, length(data));

%plotting the signal in both domains
figure;
plot(Y_audio,abs(X_audio));
title('Voice signal in frequency domain')

% figure;
% plot(tvec,data);
% title('Signal in time domain')
order_audio = 3;
coeff_audio = fir1(order_audio,(Fc/(Fs_audio/2)),'low');
figure;
[H_audio,F_audio] = freqz(coeff,1,512);
plot(F_audio,abs(H_audio));

out2 = filter(coeff_audio,1,data);
plot (Y_audio,abs(fftshift(fft(out2))));
title('Filtered Signal in frequency domain')
sound (out2,Fs_audio);