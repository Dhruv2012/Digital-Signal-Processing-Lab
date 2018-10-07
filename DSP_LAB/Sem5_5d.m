clc;
close all;
clear all;
x=[1 2 3 4];
y=[4 3 2 1];
Ex=0;   %Energy of x 
Ey=0;   %Energy of y 
corrcoeff=0; %correlation coefficient of x and y 
autocorrcoeff=0; %auto correlation coefff of x
i=0; 
for n=1:1:length(x)     
    Ex=Ex+ x(n).*x(n); 
end
for n=1:1:length(y)     
    Ey=Ey+ y(n).*y(n); 
end
z=[1 -1 1 -1 1 -1 1 -1 1 -1]; 
znn=[z(10:-1:1)]; 
autocorr=zeros(1,length(z)+length(z)-1); 
ynn=[y(4:-1:1)]; 
yn =xcorr(x,y); 
crosscorr= zeros(1,length(x)+length(y)-1);   
for n=1:1:length(x)+length(y)-1     
    sum=0;     
    for k=1:1:length(x)         
        if(n-k+1)>0 && (n-k+1)<length(y)+1         
            sum = sum + x(k).*ynn(n-k+1);         
        end
    end
    crosscorr(n)=sum;     
    disp(crosscorr(n)); 
end
subplot(211);
plot(crosscorr);                  %crosscorrelation of x and y        

for n=1:1:length(x)
    i=i+x(n).*x(n);               %autocorrelation coefficient of x  
end
autocorrcoeff=i/Ex;
i=0;

for n=1:1:length(x)
    i=i+x(n).*y(n); 
end                             %correlation coefficient of x y                                                 
corrcoeff=(i/sqrt(Ex*Ey));   

for n=1:1:length(z)+length(z)-1     
    sum=0;     
    for k=1:1:length(z)        
        if(n-k+1)>0 && (n-k+1)<length(z)+1         
            sum = sum + z(k).*znn(n-k+1);         
        end
    end
    autocorr(n)=sum;     
    disp(autocorr(n)); 
end
subplot(212);     
plot(autocorr);                   %autocorrelation of z
 
 