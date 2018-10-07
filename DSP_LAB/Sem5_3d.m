clc;
clear all; 
close all; 
x=[1 2 3 4];     %signal 
y=zeros(1,length(x));   %magnitude response 
z=zeros(1,length(x));   %phase response   
for k=1:1:length(x)         %DFT     
    sum=0;     
    for i=1:1:length(x)         
        sum=sum+x(i).*exp(-j*2*pi*(k-1)*(i-1)/4);     
    end
    y(k)=sum;     
    disp(sum);     
    z(k)=atan(imag(sum)/real(sum)); 
end
subplot(131); 
stem(y);   

%IDFT 
IDFT=[10 -2+2j -2 -2-2j]; 
a=zeros(4); 
for n=1:1:4
    sum=0;     
    for k=1:1:length(IDFT)         
        sum=sum+ IDFT(k).*exp(j*(k-1)*pi*(n-1)*2/length(IDFT));     
    end
    a(n)=sum/length(IDFT);     
    disp(sum/length(IDFT)); 
end
subplot(132);
stem(a);       %inverse of DFT