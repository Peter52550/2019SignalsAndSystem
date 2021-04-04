b0 = 0.09;
b1 = [1,-2,1];
b2 = [1,2,1];
a1 = [1,-0.6,0.25];
a2 = [1,-0.2,0.02];
b = b0*conv(b1,b2);
a = conv(a1,a2);
n = 1:40;

[r,p,k] = residuez(b,a);
syms z
h_n = iztrans(0.09*((z-1)^2*(z+1)^2)/((z-0.3-0.4i)*(z-0.3+0.4i)*(z-0.1-0.1i)*(z-0.1+0.1i)));
h = double(subs(h_n, sym('n'), n));
subplot(3,3,1);
stem(h);
title('h[n]')
subplot(3,3,2);
zplane(b,a);
title('pole-zero plot')

h1 = freqz(b,a,100);
w1 = linspace(0, pi, 100);
subplot(3,3,3);
plot(w1,abs(h1));
title('H(z) magnitude')
subplot(3,3,4);
plot(w1,360/(2*pi)*angle(h1));
title('H(z) phase')

[b_n, a_n] = residuez(r,p,k);
p = roots(a_n);
z = roots(b_n);
sos = zp2sos(z,p,0.09);
b_1 = sos(1, 1:3);
a_1 = sos(1, 4:6);
b_2 = sos(2, 1:3);
a_2 = sos(2, 4:6);
H_1 = freqz(b_1, a_1, 100);
H_2 = freqz(b_2, a_2, 100);

subplot(3, 3, 5);
plot(w1, abs(H_1));
title('H1 magnitude');
subplot(3, 3, 6);
plot(w1, abs(H_2));
title('H2 magnitude');
subplot(3, 3, 7);
plot(w1, abs(H_1).*abs(H_2));
title('H1*H2 magnitude');

delta = [1];
yn = conv(delta, h);
subplot(3, 3, 8);
stem(yn);
title('y[n]');