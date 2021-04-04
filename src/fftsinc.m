n = -250:1:250;
x = sinc(pi*0.2*n);
subplot(3,2,1);
plot(n,x);

num = 501;
DFFT_x = (fft(x,num));
subplot(3,2,2);
plot(n, fftshift(abs(DFFT_x)));

X = zeros(1,501);
for k = 1:501
    for a = 1:501
        X(k) = X(k) + x(a)*exp(-j*pi/125*(a-1)*(k-1));
    end
end
subplot(3,2,3);
plot(n,abs(X));

for dur = -62:62
    w = 0.5*(1+cos(2*pi/125*dur));
end
for dur = -250:-63
    w = 0;
end
for dur = 63:250
    w = 0;
end
subplot(3,2,4);
plot(n,w);

y = w*x;
subplot(3,2,5);
plot(n,y);




