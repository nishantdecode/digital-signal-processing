clc;
clear all;
close all;
fp = input('Enter the Pass band frequency in Hz = ' ); fs = input('Enter the Stop band frequency in Hz = '); Fs = input('Enter the Sampling frequency in Hz = '); Ap = input(' Enter the Pass band ripple in db:');
As = input('Enter theStop band ripple in db:'); wp=2*pi*fp/Fs;
ws=2*pi*fs/Fs;
Up = 2*tan(wp/2);
Us = 2*tan(ws/2);
[n,wn]= buttord (Up,Us,Ap,As,'s');
disp('order of the filter N =');
disp(n);
disp('Normalized cut off frequency = ');
disp(wn);
[num, den] = butter(n,wn,'s');
[b,a] = bilinear(num, den,1);
freqz(b,a,512,Fs);
printsys(b,a,'z');
sys = tf(b, a, 1/Fs);
display(sys);