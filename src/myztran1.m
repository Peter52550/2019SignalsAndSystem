% Default
z = [1 1 -1 -1];
p = [0.3+0.4i 0.3-0.4i 0.1+0.1i 0.1-0.1i];
k = 0.09;
N = 50;
n = 1:N;
w = [0, pi]; % frequency from 0 to pi

% Pole-Zero to Transfer Function
[b, a] = zp2tf(transpose(z),p,k);
H = freqz(b,a, 100);
w = linspace(0, pi, 100);

% a
syms x
H_ori = k*((x-1)^2*(x+1)^2)/((x-0.3-0.4i)*(x-0.3+0.4i)*(x-0.1-0.1i)*(x-0.1+0.1i));
h = iztrans(H_ori);
h_n = double(subs(h, sym('n'), n));

% e
sos = zp2sos(z, p, k);
b_1 = sos(1, 1:3);
a_1 = sos(1, 4:6);
b_2 = sos(2, 1:3);
a_2 = sos(2, 4:6);
H_1 = freqz(b_1, a_1, 100);
H_2 = freqz(b_2, a_2, 100);

% f
delta = [1];
y_n = conv(delta, h_n)

% plot
figure
subplot(3, 3, 1)
stem(h_n)
title('(a)')

subplot(3, 3, 2)
zplane(b, a)
title('(b)')

subplot(3, 3, 3)
plot(w, abs(H))
title('(c)-magnitude')
subplot(3, 3, 4)
plot(w, angle(H)*180/pi)
title('(c)-phase')

subplot(3, 3, 5)
plot(w, abs(H_1))
title('(e)-H1 mag')
subplot(3, 3, 6)
plot(w, abs(H_2))
title('(e)-H2 mag')
subplot(3, 3, 7)
plot(w, abs(H_1).*abs(H_2))
title('(e)-H1*H2 mag')

subplot(3, 3, 8)
stem(n, y_n)
title('(f)')