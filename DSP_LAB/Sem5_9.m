clc
close all
clear all
M=7;
fc=1/8;
hmm=zeros(1,M);          %hamming output
w1=zeros(1,M);           %hamming
w2=zeros(1,M);           %hanning
w3=zeros(1,M);           %rectangular
hnn=zeros(1,M);          %hanning output
sq=zeros(1,M);           %square output 
hd=zeros(1,M);           %filter
hd_normal=zeros(1,M);    %normalized output
sum=0;

for i=1:1:M
    if i==4
        hd(i)=1/4;
    end
    hd(i)=sin((pi*(i-4))/4)/pi*(i-4);
    sum = sum+abs(hd(i));
end

for i=1:1:M
    hd_normal(i)=hd(i)/sum;
end

for i=1:1:M
    w1(i)= 0.54 - 0.46*cos(2*pi*(i-1)/(M-1));
    w2(i)= 0.5*(1-cos(2*pi*(i-1)/(M-1)));
    w3(i)= 1;
    sq(i)=hd_normal(i).*w3(i);
    hmm(i)=hd(i).*w1(i);
    hnn(i)=hd(i).*w2(i);
end

b=fir1(M-1,fc);
[h f]=freqz(hnn);
[d f]=freqz(hmm);
[g f]=freqz(b);
[i f]=freqz(sq);

plot(f,abs(d),'r');  %freq responce of hamming window filter in red colour
hold on
plot(f,abs(i),'g');  %freq responce of rectangular window filter in green colour
hold on
plot(f,abs(h),'b');  %freq responce of hanning window filter in blue colour
hold on
plot(f,abs(g),'b');  %freq responce of fir filter in red colour
hold off

disp(hd);
disp(w1);
disp(hmm);
    
    