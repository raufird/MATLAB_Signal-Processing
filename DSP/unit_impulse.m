clc;
clear all;
close all;
for n = -10:1:10
    if n == 0
        i = 1;
    else
        i = 0;
    end
    stem(n,i);
    hold on;
end
xlabel('Discrete-time (n)');
ylabel('Amplitude )');
title('Unit impulse sequence');
axis([-10 10, 0 1.2]);