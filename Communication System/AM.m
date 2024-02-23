% MATLAB script for Amplitude Modulation

% Clear the command window, workspace, and close all figures
clc;
clear all;
close all;

% Define parameters
Vc = 5;         % Carrier amplitude
thetaC = 0;     % Carrier phase
fc = 30;        % Carrier frequency
Vm = 5;         % Modulating amplitude
thetam = 0;     % Modulating phase
fm = 2;         % Modulating frequency

% Define time vector
t = 0:0.01:2.0;

% Carrier signal
vc = Vc * cos(2 * pi * fc * t + thetaC);
subplot(3,1,2);
plot(t, vc);
axis([0 2 -Vc-2 Vc+2]); % Adjusted axis limits
xlabel('Time (sec)');
ylabel('Amplitude (volts)');
title('Carrier signal');

% Modulating signal
vm = Vm * sin(2 * pi * fm * t + thetam);
subplot(3,1,1);
plot(t, vm);
axis([0 2 -Vm-2 Vm+2]); % Adjusted axis limits
xlabel('Time (sec)');
ylabel('Amplitude (volts)');
title('Modulating signal');

% Modulated signal
ka = 1; % Modulation index
ma = (ka * Vm) / Vc;
va = Vc * (1 + ma * cos(2 * pi * fm * t + thetam)) .* cos(2 * pi * fc * t + thetaC);
subplot(3,1,3);
plot(t, va);
axis([0 2 -Vc-2 Vc+2]); % Adjusted axis limits
xlabel('Time (sec)');
ylabel('Amplitude (volts)');
title('Modulated signal');

% Overall comment:
% The script performs amplitude modulation by generating a carrier signal, modulating signal, and the modulated signal. 
% It plots each signal in a separate subplot, adjusts the axis limits for better visualization, and adds appropriate labels and titles.
