% Clear Command Window, Workspace, and Close all figures
clc;
clear all;
close all;

% Define amplitude, frequency, phase, time parameter and sample rate for the modulating signal
Vm = 5;         
fm = 1;         
thetam = 0;     
minTime = 0;    
maxTime = 1;    
samplePerTime = 1000;   
t = minTime : 1/samplePerTime : maxTime;
t = t(1:end-1);     % Adjust time vector to match the number of samples

% Generate the modulating signal (sine wave)
modulatingSignal = Vm * sin(2*pi*fm*t + thetam);

% Plot the modulating signal
subplot(3,1,1);
plot(t, modulatingSignal);
hold on;
axis([-minTime-0.01 maxTime+0.01 -2*Vm +2*Vm]);
xlabel('Time (sec)');
ylabel('Amplitude (V)');
title('Modulating signal');

% Generate the carrier pulse train for PWM
pulseTrain = [];
Vc = 5;        
fc = 10;         
n = fc * maxTime;
m = samplePerTime/fc;
duty = 300;      % Duty cycle of the pulse train 
on_t = duty * m / 100;
off_t = m - on_t;
for i = 1:1:n
    pulseTrain(m*(i-1)+1 : m*(i-1)+on_t) = Vc;          % On period
    pulseTrain(m*(i-1)+on_t+1 : m*(i-1)+on_t+off_t) = 0; % Off period
end

% Plot the carrier pulse train
subplot(3,1,2);
plot(t, pulseTrain);
grid on;
axis([-minTime-0.01 maxTime+0.01 -1 Vc+1]);
xlabel('Time (sec)');
ylabel('Amplitude (volts)');
title('Carrier pulse train')

% Generate a sawtooth signal (for visualization)
sawtoothSignal = 1.8 * Vm * sawtooth(2*pi*fc*t);
subplot(3,1,1);
plot(t, sawtoothSignal);
grid on;

% Perform Pulse Width Modulation (PWM)
modulatedSignal = zeros(size(t)); % Initialize modulated signal vector 

for i = 1:1:length(sawtoothSignal)
    if (modulatingSignal(i) >= sawtoothSignal(i))
        modulatedSignal(i) = Vc;    
    else
        modulatedSignal(i) = 0;    
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
