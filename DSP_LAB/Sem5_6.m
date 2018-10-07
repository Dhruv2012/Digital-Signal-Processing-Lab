clc
close all
clear all
fm=1;
fs=100;
t1=-2*pi:0.01:2*pi;
y=sin(2*pi*t1*fm);
t2=-2*pi:1/fs:2*pi;
sample=sin(2*pi*t2*fm);
DFT_time=zeros(1,10);
FFT_time=zeros(1,10);
DFT=zeros(10,1024);
FFT=zeros(10,1024);
for power=1:1:10
    L=2^power;
    tic
    ans1=zeros(1,L);
    for k=0:L-1
        temp=0;
        for n=0:L-1
              temp=sample(1,(n+1))*exp(-1*j*n*2*pi*k/L);
        DFT(power,(k+1))=DFT(power,(k+1))+temp;
        end
    end
DFT_time(1,power)=toc;
tic
      FFT=fft(sample,L,power);
FFT_time(1,power)=toc;
end
DFT_time
FFT_time
plot(DFT_time,'r');
hold on
plot(FFT_time,'b');
hold off
title('Time Complexity');
xlabel('n-point');
ylabel('relative time');

    
