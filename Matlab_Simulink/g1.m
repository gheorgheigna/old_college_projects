clc; clear all; close all;
% Algoritmul Backward Euler

% Definirea valorilor elementelor din circuit
Vg=8; Vo=5; io=2; Iomin=1; fs=80e3; Lm=200e-6; L2=185.1e-6; C=1e-3;
VD1=0.4; VD2=0.4; VD4=0.4; Rc=10e-3; Rg=10e-3; Ron=0.001; n=0.96;
R=2.5; D=0.52;
Ts=1/fs;

% Definirea matricilor de stare
Ur=[Vg;VD1];
Rp=R*Rc/(R+Rc);


A1=[-(Ron+Rg+Rp)/(n^2*Lm) -R/(n*Lm*(R+Rc)); R/((R+Rc)*n*C) -1/((R+Rc)*C)];
B1=[1/(n*Lm) -1/(n*Lm) 0 0; 0 0 0 0];
E1=[1 0; Rp/n R/(R+Rc); 1/n 0];
F1=[0 0 0 0; 0 0 0 0; 0 0 0 0];


A2=[-Rp/((n+1)^2*Lm) -R/((n+1)*Lm*(R+Rc)); R/((n+1)*(R+Rc)*C) -1/((R+Rc)*C)];
B2=[0 0 -1/((n+1)*Lm) -1/((n+1)*Lm); 0 0 0 0];
E2=[1 0; Rp/(n+1) R/(R+Rc); 0 0];
F2=[0 0 0 0; 0 0 0 0; 0 0 0 0];

AD=D*A1+(1-D)*A2; 
BD=D*B1+(1-D)*B2; 
ED=D*E1+(1-D)*E2; 
FD=D*F1+(1-D)*F2;

h=80e-9; Tsim=10e-3;
time=0:h:Tsim;
t=time(1); x=[0 0]; m=1;
I=eye(2);
while t<Tsim
    a=floor(t/Ts);
    if (t>=a*Ts)&(t<(a+D)*Ts)
       q=1; 
    else
       q=0;
    end
    A=q*A1+(1-q)*A2;
    B=q*B1+(1-q)*B2;
    Ur=[Vg;VD1;VD2;VD4]
   x(m+1,:)=((inv(I-h*A)*(x(m,:))'+h*B*Ur));
    m=m+1; t=time(m);
end
plot(time,x);
title('Simulare Backward Euler');grid;
xlabel('Timp')
ylabel('Vg')
