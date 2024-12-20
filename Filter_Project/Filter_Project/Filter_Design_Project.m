%{
    Reference Code
Title:      MATLAB Filter Demo 
Author:     Dr. Jon Mitchell
Date:       11/30/2023
Avaiable:   https://uta.instructure.com/courses/155206/files/29183499?module_item_id=7114767
%}

[x, fs] = audioread('noisyconversation.wav');
figure(1), spectrogram(x, 100), title('Spectrogram of Noisy Audio');

k = linspace(-fs/2, fs/2, length(x));
X = fft(x);
X = X./max(X);
%figure(2), plot(k, abs(fftshift(X))), title('DFT of Noisy Audio');
figure(3), plot(k, 20*log10(abs(fftshift(X)))), title('log DFT of Noisy Audio');

% Ringing noise starts at around 0.33
% Want a relative narrow transition region

% Lowpass Implementation
[N, Wc] = buttord(0.285, 0.325, 1, 45);                    % Much clearer voice, however thunder is still in background

% Bandpass Implementation
%[N, Wc] = buttord([0.08, 0.25], [0.03, 0.31], 1, 32);       % Just the voice, however it is less clear
[B, A] = butter(N, Wc);

[H, W] = freqz(B, A, (length(x))/2);
figure(4), plot(W/pi, abs(H)), title('Magnitude of Filter Response');

W = W.';
H = H.';
k2 = (fs/2)*[-fliplr(W) 0 W]/pi;
H2 = [fliplr(H) 1 H];

y = filter(B, A, x);
Y = fft(y);
Y = Y./max(Y);

figure(5), subplot(2, 1, 1), plot(k, abs(fftshift(X))), title('DFT Before Filtering'), hold on;
figure(5), subplot(2, 1, 1), plot(k2, abs(H2)), hold off;
figure(5), subplot(2, 1, 2), plot(k, abs(fftshift(Y))), title('DFT After Filtering'), hold on;
figure(5), subplot(2, 1, 2), plot(k2, abs(H2)), hold off;
figure(6), subplot(2, 1, 1), plot(x), title('Audio Before Filtering'), hold on;
figure(6), subplot(2, 1, 2), plot(y), title('Audio After Filtering');

sound(y, fs);

audiowrite("Filtered_conversation.wav", y, fs);

