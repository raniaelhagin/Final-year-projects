%%
% Alexandria University
% Faculty of Engineering
% Electrical and Electronic Engineering Department
%
% Course: DSP Lab
% 
% Lab No. 1: Encoding and Decoding Touch-Tone Signals
% Name: Rania Hamada Mohammed 
% ID: 79

%% Encoding 
keys = {'1', '2', '3', 'A';
        '4', '5', '6', 'B';
        '7', '8', '9', 'C';
        '*', '0', '#', 'D'};
    
% Ask the user at first how many keys will be pressed
keys_no = input('How many keys will be pressed? ');

indices = ones(1, keys_no);  %to be used to generate the tone 
% Ask the user to enter the keys
valid = true;
while valid
    input_keys = input('Please, enter the keys: ', 's');

    % check if it's a valid key
    if strlength(input_keys) == keys_no
        for i=1:keys_no
            index = find([keys{:}] == input_keys(i));
            if index
                % valid 
                valid = false;
                indices(i) = index;
            else
                valid = true;
                disp('Invalid key')
                break
            end
        end
    else
        disp('Invalid key')
    end
end

low_freqs = [697 770 852 941];
high_freqs = [1209 1336 1477 1633];

sampling_freq = 8000; % sampling frequency 
time_duration = 1; 
points_no = sampling_freq*time_duration;
startpt = 0;
endpt = 1;
t = linspace(startpt, endpt, points_no);

% generate frequency matrix and waveform of each key 
freq_mat = cell(length(low_freqs), length(high_freqs));
waveforms = cell(length(low_freqs), length(high_freqs));

for i=1:length(low_freqs)
    for j=1:length(high_freqs)
    freq_mat{i,j} = [low_freqs(i) high_freqs(j)];
    f1 = freq_mat{i,j}(1);
    f2 = freq_mat{i,j}(2);
    waveforms{i,j} = sin(2*pi*f1*t) + sin(2*pi*f2*t);
    end
end

% generate tone for each number 
tone = ones(1, keys_no*sampling_freq);
duration_tone = keys_no*time_duration;
samples = sampling_freq*duration_tone;
t_tone = linspace(0, duration_tone, samples);

for l=1:keys_no
    s = (l-1)*sampling_freq + 1;
    e = l*sampling_freq;
    tone(:,s:e) = waveforms{indices(l)};
end

% tone in the frequency domain 
TONE = fftshift(fft(tone));
f_vec = linspace(-sampling_freq/2, sampling_freq/2, samples);

% plotting results 
subplot(2,1,1)
plot(t_tone, tone)
title('Time Domain')
xlabel('t(s)')
ylabel('tone(t)')

subplot(2,1,2)
plot(f_vec, abs(TONE))
title('Frequency Domain')
xlabel('f(Hz)')
ylabel('|TONE(f)|')

% play sound
sound(tone, sampling_freq)

%% Decoding 
time_seg = duration_tone / duration_tone;

