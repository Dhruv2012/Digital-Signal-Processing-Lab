clc;
clear all;
close all;
M=7;   %here M is odd number
k=0:M-1;
w=2*pi*k/M;
Hd=exp(-1*j*w*(M-1)/2);
Hd=Hd.*(w<=pi/4);
hn=ifft(Hd);
hn=[zeros(1,M) hn];
op=hn(1,M+1-(M-1)/2:M+(M+1)/2);
freqz(op);
disp(Hd);
