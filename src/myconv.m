Q1_x1 = zeros(1,40);
for n = 1 : 20
    Q1_x1(n) = n;
end
for n = 21 : 40
    Q1_x1(n) = 40 - n;
end
subplot(4,2,1);
stem(Q1_x1);
title('x_1[n] plot');
xlabel('n');
ylabel('x_1[n]')

Q1_x2 = zeros(1, 10);
for n = 1 : 10
    Q1_x2(n) = 1;
end
subplot(4,2,2);
stem(Q1_x2);
title('x_2[n] plot');
xlabel('n');
ylabel('x_2[n]');

y1 = conv(Q1_x1, Q1_x2);
subplot(4,2,3);
stem(y1);
title('Convolution of Q1 x_1[n] and Q1 x_2[n]');
xlabel('n');
ylabel('y[n]');

a = zeros(48, 10);
for i = 1:10
    for j = i:i+19
        a(j,i) = j-i+1;
    end
    for j = i+20:i+38
        a(j,i) = 40-(j-i+1);
    end
end
  
b = ones(10, 1);

c = a*b;
subplot(4,2,4);
stem(c);
title('matrix one convolution');
xlabel('n');
ylabel('y[n]')



Q2_x1 = zeros(1, 5);
for n = 1:5
    Q2_x1(n) = 3 ^ n;
end
subplot(4,2,5);
stem(Q2_x1);
title('x_1[n] plot');
xlabel('n');
ylabel('x_1[n]')

Q2_x2 = zeros(1, 5);
for n = 1:5
    Q2_x2(n) = 2 ^ n;
end
subplot(4,2,6);
stem(Q2_x2);
title('x_2[n] plot');
xlabel('n');
ylabel('x_2[n]')

y2 = conv(Q2_x1, Q2_x2);
subplot(4,2,7);
stem(y2);
title('Convolution of Q2 x_1[n] and Q2 x_2[n]');
xlabel('n');
ylabel('y[n]');

d = zeros(9, 5);
for i = 1:5
    for j = i:i+4
        d(j,i) = 3 ^ (j-i+1);
    end
end

e = zeros(5,1);
for i = 1:5
    e(i,1) = 2 ^ (i);
end
f = d*e;

subplot(4,2,8);
stem(f);
title('matrix two convolution');
xlabel('n');
ylabel('y[n]');
