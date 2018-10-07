clc;
close all;
clear all;
M=7;
for k=1:1:M
    h(k)=(1/M)*(1+(2*cos((2*pi/M)*(3-(k-1)))));
end
 
f = [0 0.5 0.5 1];
m = [1 1 0 0];
b = fir2(6,f,m);
[h2,w] = freqz(b,1);
subplot(121);
plot(f,m,w/pi,abs(h2));
[h1,w] = freqz(h,1);
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Magnitude');
legend('Ideal','FIR2 design');
legend boxoff
title('Comparison of Frequency Response Magnitudes');
subplot(122);
plot(f,m,w/pi,abs(h1));
xlabel('Normalized Frequency (from eq) (\times\pi rad/sample)');
ylabel('Magnitude');
legend('Ideal','FIR2 design');
legend boxoff
title('Comparison of Frequency Response Magnitudes');
