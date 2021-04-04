n = 1:1:1000;
x = cos(2*pi*(n-1)*0.002)+2*cos(200*pi*0.002*(n-1));
subplot(3,1,1);
plot(n,x);

[b_1,a_1] = butter(16,0.2);
[h_1,w_1] = freqz(b_1,a_1,100);
y_1 = filter(b_1,a_1,x);
subplot(3,1,2);
plot(n,y_1);

[b_2,a_2] = butter(8,[0.2,0.75]);
[h_2,w_2] = freqz(b_2,a_2,100);
y_2 = filter(b_2,a_2,x);
subplot(3,1,3);
plot(n,y_2);
