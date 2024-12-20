n = -20:20;

unitstep = n>=0;
unitstep_3 = n>=3;

xn = (0.5).^n.*cos((2*pi.*n)/13).*unitstep;

hn = unitstep - unitstep_3;

yn = conv(xn, hn, 'same');

figure(1), subplot(2, 2, 1), stem(n, unitstep), xlabel('n'), ylabel('Amplitude'), title('u[n]'), axis([-10 10 -0.5 1.5]);

figure(1), subplot(2, 2, 2), stem(n, xn), xlabel('n'), ylabel('Amplitude'), title('x[n]'), axis([-10 10 -0.5 1.5]);

figure(1), subplot(2, 2, 3), stem(n, hn), xlabel('n'), ylabel('Amplitude'), title('h[n]'), axis([-10 10 -0.5 1.5]);

figure(1), subplot(2, 2, 4), stem(n, yn), xlabel('n'), ylabel('Amplitude'), title('Convolution Sum'), axis([-10 10 -1.5 2.5]);



