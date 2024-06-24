clc;
clear all;
close all;
alpha = -0.1+0.3j;
n = -10:1:10;
x = exp(alpha*n);

subplot(2,2,1)
stem(n,real(x));
title('Real Part');
xlabel('Discrete-time(n)');
ylabel('Real Value');

subplot(2,2,2);
stem(n,imag(x));
title('Imaginary Part');
xlabel('Discrete-time');
ylabel('Imaginary Part');

subplot(2,2,3);
stem(n,abs(x));
title('Magnitude');
xlabel('Discrete-time(n)');
ylabel('Magnitude');

phase = angle(x)*180/pi;
subplot(2,2,4)
stem(n,phase);
title('Phase');
xlabel('Discrete-time(n)');
ylabel('Phase');