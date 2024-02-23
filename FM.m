clc; % Clear the command window

% Define parameters
Am = 1;         % Amplitude of the message signal
fm = 10;        % Frequency of the message signal (Hz)
Ac = 10;        % Amplitude of the carrier signal
Fc = 1000;      % Frequency of the carrier signal (Hz)
Fs = 10000;     % Sampling frequency (Hz)
deviation = 50; % Frequency deviation (Hz)

% Define time vector
t = 0:1/Fs:1;

% Generate message signal
m_t = Am * sin(2*pi*fm*t);

% Generate carrier signal
c_t = Ac * sin(2*pi*Fc*t);

% Frequency modulation
y_fm = fmmod(m_t, Fc, Fs, deviation);

% Plotting
subplot(3,1,1);
plot(t, m_t);
xlabel('Time (s)');
ylabel('Amplitude');
title('Message Signal');

subplot(3,1,2);
plot(t, c_t);
xlabel('Time (s)');
ylabel('Amplitude');
title('Carrier Signal');

subplot(3,1,3);
plot(t, y_fm);
xlabel('Time (s)');
ylabel('Amplitude');
title('Frequency Modulated Signal');

% Overall comment:
% This script generates a frequency modulated (FM) signal by modulating a
% message signal onto a carrier signal using frequency modulation.
