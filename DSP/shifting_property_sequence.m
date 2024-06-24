clc;
clear all;
close all;
x = [1:1:7, 6:-1:1];
n = -2:1:10;

[x11, n11] = sigshift(x, n, 5);
subplot(3, 1, 1);
stem(n11, x11);
xlabel('Discrete-time (n11)');
ylabel('Amplitude (x11)');
title('Delayed sequence');
axis([-1 17, -1 8]);

[x12, n12] = sigshift(x, n, -4);
subplot(3, 1, 2);
stem(n12, x12);
xlabel('Discrete-time (n12)');
ylabel('Amplitude (x12)');
title('Advanced Sequence');
axis([-7 8, -1 8]);

[x1, n1] = sigadd(2*x11, n11, -3*x12, n12);
subplot(3, 1, 3);
stem(n1, x1);
xlabel('Discrete-time (n1)');
ylabel('Amplitude (x1)');
title('Output sequence');
axis([-8 16, -25 25]);