n = -49:50;

xn = randn(1, 100);
hn = randn(1, 100);

yn = conv(xn, hn, 'same');

figure(1), subplot(3, 1, 1), stem(n, xn), xlabel('n'), ylabel('Amplitude'), title('x[n]'), axis([-20 20 -3 3]);

figure(1), subplot(3, 1, 2), stem(n, hn), xlabel('n'), ylabel('Amplitude'), title('h[n]'), axis([-20 20 -3 3]);

figure(1), subplot(3, 1, 3), stem(n, yn), xlabel('n'), ylabel('Amplitude'), title('Convolution Sum'), axis([-20 20 -20 20]);
