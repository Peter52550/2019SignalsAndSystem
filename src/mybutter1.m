n = 1:1:100;
x1 = cos(2*pi*0.1*(n-1));
figure(1);
plot(n,x1);

[b1,a1] = butter(3,0.1);
[h1,w1] = freqz(b1,a1,100);
figure(2);
subplot(3,3,1);
plot(w1,20*log10(abs(h1)));
subplot(3,3,2);
plot(w1,360/(2*pi)*angle(h1));
y1 = filter(b1,a1,x1);
subplot(3,3,3);
plot(n,y1);

[b2,a2] = butter(7,0.1);
[h2,w2] = freqz(b2,a2,100);
subplot(3,3,4);
plot(w2,20*log10(abs(h2)));
subplot(3,3,5);
plot(w2,360/(2*pi)*angle(h2));
y2 = filter(b2,a2,x1);
subplot(3,3,6);
plot(n,y2);

[b3,a3] = butter(3,0.5);
[h3,w3] = freqz(b3,a3,100);
subplot(3,3,7);
plot(w3,20*log10(abs(h3)));
subplot(3,3,8);
plot(w3,360/(2*pi)*angle(h3));
y3 = filter(b3,a3,x1);
subplot(3,3,9);
plot(n,y3);

