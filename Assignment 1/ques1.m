% HARSHIT RAI
% 2017152

%%
% Input Sinusoid
clear all;
clc;

fm=1*1000; % Message signal frequency
tm=1/fm;

fs=250*1000; % Sampling frequency of original signal : almost continuous
ts=1/fs;

n=5; % Generate 5 cycles
a=2; % Amplitude of sinusoid
t= 0 : ts : (n*tm-ts) ; % From 0 to ts in step of (n*tm-ts)

mt=a*sin(2*pi*fm*t);  % Analog Input Signal

subplot(3,1,1);
plot(t,mt);
title('Analog Input Signal');
xlabel('Time');
ylabel('Amplitude');

%%
% Sampling

fs1=20*1000;   % Sampling frequency
ts1=1/fs1; 
t1= 0 : ts1 : (n*tm-ts1) ; % Time index
mt1=a*sin(2*pi*fm*t1);

subplot(3,1,2);
plot(t,mt);
title('Sampled Signal');
xlabel('Time');
ylabel('Amplitude');
hold on;
stem(t1,mt1);

%% 
%Quantisation

bit=3; % Quantization bit for 8 levels 
l=2^bit;
del=2*a/l; % Step size

samples=length(mt); % Total number of samples
levels=zeros(1,samples); % Array for quantization levels

up=a-del/2; % Maximum voltage
down=-a+del/2; % Minimum voltage


%In the below "for loop" we are mapping the sample values to their quantization levels

for h=down:del:up % Iterating from lowest to the highest level
    for r=1:samples % For all samples
        % If the sample value lies within the range -del/2 < sample < del/2
        if(((h-del/2)<mt(r))&&(mt(r)<(h+del/2)))
            levels(r)=h;                       
        end                              
    end                               
end

subplot(3,1,3);
plot(t,levels,t1,mt1);
title('Quantized Signal');
xlabel('Quantization intervals');
ylabel('Quantization levels');

%%
% Quantization error

error=a-max(levels);
display(error);

% We know that maximum sample value = 2(Amplitude) and maximum quantization level value=1.7500
% and, error= Actual value - apparent value
