% Clear command window, workspace, and close all figures
clc;            
clear all;     
close all; 

% Define parameters for analog signal
A = 5;                 
f = 1;               
minTime = 0;     
maxTime = 1; 
theta = 0;  
samplePerTime = 100;    
t = minTime : 1/samplePerTime : maxTime;      

% Generate analog signal 
analogSignal = A*sin(2*pi*f*t + theta);   
subplot(3,2,[1,2]);              
plot(t , analogSignal);       
axis([minTime maxTime -A-1 A+1]); 
xlabel('Time (sec)');    
ylabel('Amplitude (volts)');   
title('Analog Signal');  
grid on;               

% Calculate the sampling rate and create time vector for discrete sampling
samplingRate = 30*f;             
sampleTime = minTime : 1/samplingRate : maxTime; 

% Sample the analog signal
sampledSignal = A*sin(2*pi*f*sampleTime + theta); 
subplot(3,2,3);                   
stem(sampleTime ,sampledSignal );    
axis([minTime maxTime -A-1 A+1]); 
xlabel('Time (sec)');        
ylabel('Amplitude (volts)');  
title('Sampled Signal');    
grid on;                 

% Applying Quantization
n = 8;           
L = 2^n; 
minV = -A; 
maxV = +A;   
delta = (maxV - minV)/L;             
partition = minV : delta : maxV;  
codebook = minV - (delta/2) : delta : maxV + (delta/2);  
[index,quants] = quantiz(sampledSignal,partition,codebook);

% ploting Quantized signal
subplot(3,2,4); 
stem(sampleTime ,quants );
axis([minTime maxTime -A-1 A+1]);
xlabel('Time (sec)');
ylabel('Amplitude (volts)');
title('Quantized Signal');
grid on; 

% Convert Quantization indices and Construck Codevector
codematrix = de2bi(index,'left-msb'); 
k = 1;                        
for i=1:1:length(index)    
    for j=1:1:n                 
        codevector(k)=codematrix(i,j); 
        k=k+1;    
    end
end

% Plot the codevector
subplot(3,2,[5,6]);  
stairs(codevector);  
title('PCM Signal'); 