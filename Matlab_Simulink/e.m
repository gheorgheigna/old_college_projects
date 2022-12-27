
clc; clear all; close all;
Vg=8; Vo=5; Iomax=2; Iomin=1; fs=80e3; Lm=200e-6; L2=185.1e-6; C=1e-3;
VD1=0.4; VD2=0.4; VD4=0.4; Rc=10e-3; Rg=10e-3;
n=0.96; D=0.52; R=2.5; Ron=0.02;
Ts=1/fs; fpert=1000; Vgpert=0.2;
Rp=R*Rc/(R+Rc);
Ur=[Vg; VD1; VD2; VD4];



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

[numarator,numitor]=ss2tf(AD,BD,ED,FD,1);
Gg_Vg_Vo=tf(numarator(2,:),numitor);

Voperturbatii=abs(evalfr(Gg_Vg_Vo,j*2*pi*fpert))*Vgpert

bode(Gg_Vg_Vo)
grid