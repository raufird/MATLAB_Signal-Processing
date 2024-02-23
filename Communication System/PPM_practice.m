% Clear command window, workspace, and close all figures
clc;
clear all;
close all;

% Define modulation parameters
Vm = 5;              
fm = 1;             
thetam = 0;         
minTime = 0;        
maxTime = 1;        
samplePerTime = 1000;% Sampling frequency
t = minTime : 1/samplePerTime : maxTime;
t = t(1:end-1);      % Adjust time vector to match the number of samples

% Generate the modulating signal (sine wave)
modulatingSignal = Vm .* sin(2*pi*fm*t + thetam);

% Plot the modulating signal
subplot(3,1,1);
plot(t, modulatingSignal);
hold on;
axis([-minTime-0.01 maxTime+0.01 -2*Vm +2*Vm]);
xlabel('Time (sec)');
ylabel('Amplitude (V)');
title('Modulating signal');

% Generate the carrier pulse train
pulseTrain = [];
Vc = 5;               
fc = 10;              
n = fc * maxTime;      
m = samplePerTime/fc;        
duty = 30;            % Duty cycle of the pulse train 
on_t = duty * m / 100;
off_t = m - on_t;
for i = 1:1:n
    pulseTrain(m*(i-1)+1 : m*(i-1)+on_t) = Vc;              % from position 1 : 2 = Vc
    pulseTrain(m*(i-1)+on_t+1 : m*(i-1)+on_t+off_t) = 0;    % from 3 : rest = 0
end

% Plot the carrier pulse train
subplot(3,1,2);
plot(t, pulseTrain);
grid on;
axis([-minTime-0.01 maxTime+0.01 -1 Vc+1]);
xlabel('Time (sec)');
ylabel('Amplitude (volts)');
title('Carrier pulse train');

% Generate the sawtooth signal for comparison
sawtoothSignal = 1.8 * Vm * sawtooth(2*pi*fc*t);
subplot(3,1,1);
plot(t, sawtoothSignal);
grid on;

% Perform Pulse Position Modulation
modulatedSignal = zeros(1, length(pulseTrain));

for i = 1:1:n
    for j = 1:1:i*m
        if (modulatingSignal(m*(i-1)+j) < sawtoothSignal(m*(i-1)+j))
            modulatedSignal(m*(i-1)+j : m*(i-1)+j+on_t-1) = Vc;
            break
        end
    end
end

% Plot the modulated signal
subplot(3,1,3);
plot(t, modulatedSignal);
grid on;
axis([-minTime-0.01 maxTime+0.01 -1 Vc+1]);
xlabel('Time (sec)');
ylabel('Amplitude (volts)');
title('Modulated signal');
