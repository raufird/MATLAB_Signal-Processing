clc; 
clear all; 
close all;

x = [3, 11, -7, 0, -1, 4, 2];  % Input sequence 1
nx = [-3 : 1 : 3];  % Time index for x

subplot(3,1,1);
stem(nx, x);
xlabel('Discrete Time (nx)');
ylabel('Amplitude x(n)');
title('Input Sequence x(n)');
axis([-4 4 -12 15]);
grid on;

h = [2, 3, 0, -5, 2, 1];  % Input sequence 2
nh = -1 : 1 : 4;  % Time index for h
subplot(3,1,2);
stem(nh, h);
xlabel('Discrete Time (nh)');
ylabel('Amplitude h(m)');
title('Impulse Response h(m)');
axis([-2 5 -6 4]);
grid on;

[y, ny] = conv_m(x,nx,h,nh);  % Compute convolution sum
subplot(3,1,3);
stem(ny, y);
xlabel('Discrete Time (ny)');
ylabel('Amplitude (n)');
title('Convolution Sum');
axis([-5 10 -60 60])
grid on;