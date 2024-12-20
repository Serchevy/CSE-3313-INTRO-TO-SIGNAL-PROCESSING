w = linspace(-pi, pi, 101);

H_ejw = 1 ./ (1 - 0.5*exp(2*1i*w));     % H(e^jw)

H_e_negjw = conj(H_ejw);                % Cmplx Conjg of H(e^jw)

Hmw = (abs(H_ejw .* H_e_negjw)).^2;     % Calculate Hm[𝜔]

figure(1), subplot(1, 1, 1), stem(w, Hmw), xlabel('𝜔'), ylabel('|𝐻(𝑒^(j𝜔))|^2'), title('Magnitude-Squared Frequency'), axis([-4 4 -0.5 18]);
