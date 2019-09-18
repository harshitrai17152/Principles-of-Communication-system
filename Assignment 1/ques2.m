% HARSHIT RAI
% 2017152

%%
% Message signal
clear all;
clc;

fs=200*1000; % Sampling frequency of original signal : almost continuous
ts=1/fs;
n=1000;     % Generate 1000 cycles
t= 0:ts:n*ts-ts ;  % From 0 to ts in step of (n*ts-ts)

fm=1*1000;  % Frequency of message signal 
tm=1/fm;
am=2;  % Amplitude of message signal 
mt=am*sin(2*pi*fm*t);  % Message signal 

subplot(2,1,1)       
plot(t,mt)
title('Message Signal')
xlabel('Time axis');
ylabel('Amplitude');
hold on;

%%
% Phase modulated signal

fc=6.5*1000;  % Frequency of carrier signal 
tc=1/fc;
kp=pi/2;  % Phase modulation index
ac=1;  % Amplitude of carrier signal
pt=ac*sin((2*pi*fc*t)+(kp*mt));  % Phase modulated signal 

subplot(2,1,2)       
plot(t,pt)
title('Phase modulated signal')
xlabel('Time axis');
ylabel('Amplitude');
hold on;
