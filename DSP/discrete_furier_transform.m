clc; 
clear all; 
close all;

n = 0:1:7;
x = 6*(cos(pi*n/4))*2; % Sequence

y = fft(x); % Compute DFT
magnitude = abs(y);
phase = angle(y)*180/pi;

f = (0:length(y)-1)*length(n)/length(y); % Frequency indices

subplot(2,1,1);
stem(f, magnitude);
xlabel('Frequency (f)');
ylabel('Magnitude');
title('Magnitude');
axis ([-2 10 -20 60]);

subplot(2,1,2);
stem(f, phase);
xlabel('Frequency (f)');
ylabel('Phase');
title('Angle (degree)');
axis([-2 10 -200 200]);