clc; % Clear the command window

% MATLAB script for Phase Modulation

% Clear the workspace and close all figures
clear all;
close all;

% Define parameters
Vm = 5;         % Modulating amplitude
thetam = 0;     % Modulating phase
fm = 2;         % Modulating frequency
Fc = 30;        % Carrier frequency
Fs = 1000;      % Sampling frequency
phasedev = pi/4; % Phase deviation
ini_phase = 0;  % Initial phase of the modulated signal

% Define time vector
t = 0:1/Fs:2;

% Modulating signal
m = Vm * sin(2 * pi * fm * t + thetam);

% Phase modulated signal
pm = pmmod(m, Fc, Fs, phasedev, ini_phase);

% Plotting
subplot(3,1,1);
plot(t, m);
xlabel('Time (sec)');
ylabel('Amplitude (volts)');
title('Modulating signal');

subplot(3,1,2);
plot(t, pm);
xlabel('Time (sec)');
ylabel('Amplitude (volts)');
title('Phase Modulated signal');

% Demodulation (optional, if needed)
demod = pmdemod(pm, Fc, Fs, phasedev, ini_phase);
subplot(3,1,3);
plot(t, demod);
xlabel('Time (sec)');
ylabel('Amplitude (volts)');
title('Demodulated signal');

% Overall comment:
% This script demonstrates phase modulation by generating a modulating signal,
% modulating it onto a carrier using phase modulation, and optionally
% demodulating it back to the original signal. [4](https://www.mathworks.com/help/comm/ref/pmmod.html) [5](https://www.mathworks.com/help/comm/ref/pmdemod.html)
