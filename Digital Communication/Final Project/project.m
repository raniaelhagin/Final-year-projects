% The First Square Pulse In Time Domain %
N = 1024000-1 ;                 %number of sampling
fs=10000000;                    %Sampling frequecy
Ts = 1/fs;                      %Time
B = 100000;                     %band width
T=2/B;                          %The Pulse duration
t_axis = (0:N-1)*Ts;  
f_axis = -fs/2:fs/N:fs/2-1/N;
N_sq = round(T/Ts);
one_square = ones(1,N_sq);
first_Pulse = [one_square,zeros(1,N-N_sq)];
figure;
plot(t_axis,first_Pulse,'linewidth',2);
xlim([0 2*T])
ylim([0 2])
title('The first square pulse in time')

%%
% The Second Square Pulse In Time Domain %
one_square = zeros(1,N_sq);
second_Pulse = [one_square,ones(1,N-N_sq)];
figure;
plot(t_axis,second_Pulse,'linewidth',2);
xlim([0 2*T])
ylim([0 2])
title('The Second square pulse in time')

%%
% The First Square Pulse In Frequency Domain %
first_Pulse_freq =(fftshift(fft(first_Pulse)));
first_Pulse_freq_a =abs(fftshift(fft(first_Pulse)));
figure;
plot(f_axis,first_Pulse_freq_a,'linewidth',2)
title('The first square pulse in freq')
grid on
xlim([-100000 100000]*2)
ylim([0 200])



%%
% The Second Square Pulse In Frequency Domain %

second_pulse_freq = fftshift(fft(second_Pulse));
second_pulse_freq_a= abs( fftshift(fft(second_Pulse)));
figure;
plot(f_axis,second_pulse_freq_a,'linewidth',2)
title('The Second square pulse in Frequency')
grid on
xlim([-100000 100000]*2)
ylim([0 200])

%%
% band-limited flat channel %
L=length(f_axis);
fm=100000;                         %band width 
N_S=fs/(L-1);                                                                                          
f1=-fs/2:N_S:-fm;                                                                  
P1=zeros(1,length(f1));

f2=-fm:N_S:fm;
P2=ones(1,length(f2));

f3=fm:N_S:fs/2;
P3=zeros(1,length(f3)-1);

channel=[P1 P2 P3];
figure;
plot(f_axis,channel,'linewidth',2);
title('The Channel');
xlim([-100000 100000]*2)
ylim([0 2])

%%
% The channel in time domain %
channel_T = ifft(ifftshift(channel));
figure;
plot(t_axis,channel_T,'linewidth',2)
title('channel in time')
xlim([0 2*T])
%%
%first signal after passing through the channel%
first_signal_after_ch=channel.*first_Pulse_freq;
figure;
plot(f_axis,abs((first_signal_after_ch)),'linewidth',2)
title(' first signal after the channel in freq')
xlim([-fm fm]*2)
%%

%first signal after channel in time%
first_signal_after_ch_T = ifft(ifftshift(first_signal_after_ch));
figure;
plot(t_axis,first_signal_after_ch_T,'linewidth',3)
title(' first signal after the channel in time')
xlim([0 2*T])



%%

%second signal after channel in time%
second_signal_after_ch=channel.*second_pulse_freq;
figure,
plot(f_axis,abs((second_signal_after_ch)),'linewidth',2)
title('second signal after the channel in freq')
xlim([-fm fm]*2)
ylim([0 200])

%%

%second signal after channel in time%
second_signal_after_ch_T = ifft(ifftshift(second_signal_after_ch));
figure;
plot(t_axis,second_signal_after_ch_T,'linewidth',3)
title(' second signal after the channel in time')
xlim([0 2*T])

%%

%The first and second pulses in time %
figure;
plot(t_axis,first_Pulse,'black',t_axis,second_Pulse,'red','linewidth',3)
title(' first and second square pulses in time')
ylim([0 2])
xlim([0 2*T])

%%

%The first and the second signals after passing through the channel in time%
figure;
plot(t_axis,first_signal_after_ch_T,'black',t_axis,second_signal_after_ch_T,'red','linewidth',3)
title(' first and second square pulses  after the channel in time')
ylim([-0.5 1.5])
xlim([0 2*T]) 

%%
% The First Square Pulse In Time Domain %


spast = -T/2;
first_Pulse_2 = tripuls(t_axis+spast,T,spast);


figure;
plot(t_axis,first_Pulse_2,'linewidth',2);
xlim([0 2*T])
ylim([0 2])
title('The first square pulse in time')


%%
% The second Square Pulse In Time Domain %

w = T;

tfutr = 3*T/2;
sfutr = 0.001;
second_Pulse_2 = tripuls(t_axis-tfutr,w,sfutr);

figure;
plot(t_axis,second_Pulse_2,'linewidth',2);
xlim([0 2*T])
ylim([0 2])
title('The first square pulse in time')

%%
% The First Square Pulse In Frequency Domain %
first_Pulse_freq_2 =(fftshift(fft(first_Pulse_2)));
first_Pulse_freq_a_2 =abs(fftshift(fft(first_Pulse_2)));
figure;
plot(f_axis,first_Pulse_freq_a_2,'linewidth',2)
title('The first square pulse in freq')
grid on
xlim([-100000 100000]*2)
ylim([0 200])



%%
% The Second Square Pulse In Frequency Domain %

second_pulse_freq_2 = fftshift(fft(second_Pulse_2));
second_pulse_freq_a_2= abs( fftshift(fft(second_Pulse_2)));
figure;
plot(f_axis,second_pulse_freq_a_2,'linewidth',2)
title('The Second square pulse in Frequency')
grid on
xlim([-100000 100000]*2)
ylim([0 200])



%%
%first signal after passing through the channel%
first_signal_after_ch_2=channel.*first_Pulse_freq_2;
figure;
plot(f_axis,abs((first_signal_after_ch_2)),'linewidth',2)
title(' first signal after the channel in freq')
xlim([-fm fm]*2)
%%

%first signal after channel in time%
first_signal_after_ch_T_2 = ifft(ifftshift(first_signal_after_ch_2));
figure;
plot(t_axis,first_signal_after_ch_T_2,'linewidth',2)
title(' first signal after the channel in time')
xlim([0 2*T])



%%

%second signal after channel in time%
second_signal_after_ch_2=channel.*second_pulse_freq_2;
figure,
plot(f_axis,abs((second_signal_after_ch_2)),'linewidth',2)
title('second signal after the channel in freq')
xlim([-fm fm]*2)
ylim([0 200])

%%

%second signal after channel in time%
second_signal_after_ch_T_2 = ifft(ifftshift(second_signal_after_ch_2));
figure;
plot(t_axis,second_signal_after_ch_T_2,'linewidth',2)
title(' second signal after the channel in time')
xlim([0 4*T])

%%

%The first and second pulses in time %
figure;
plot(t_axis,first_Pulse_2,'black',t_axis,second_Pulse_2,'red','linewidth',3)
title(' first and second square pulses in time')
ylim([0 2])
xlim([0 2*T])

%%

%The first and the second signals after passing through the channel in time%
figure;
plot(t_axis,first_signal_after_ch_T_2,'black',t_axis,second_signal_after_ch_T_2,'red','linewidth',3)
title(' first and second square pulses  after the channel in time')
ylim([-0.5 1.5])
xlim([0 2*T]) 
