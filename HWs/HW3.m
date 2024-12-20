      
n = -10:10;    
h = zeros(1,20);

for k = 1:21
    if n(k) == 0
        h(k) = 1 - (1/5) * h(k-1); 
    elseif n(k) > 0
        h(k) = 0 - (1/5) * h(k-1);
    else
        h(k) = 0;
    end
end

figure(1), subplot(1, 1, 1), stem(n, h), xlabel('n'), ylabel('Amplitude'), title('Unit Sample response'), axis([-10 10 -0.5 1.5]);
