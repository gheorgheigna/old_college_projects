clear all; close all; clc;
syms D 
Vo=5; Vg=8; Rg=10e-3; Rc=10e-3; Lm=200e-6; L2=185.1e-6; C=100e-6 ; 
Vd1=0 ; Vd2=0; Vd3=0.4; fs=80e3; n=0.962; Ts=1/fs;
  Ron=0.01; R=2.5;
Rp=(R*Rc)/(R+Rc);
while(Rc<0.1)
A1=[-(Rg+Ron+Rp)/(Lm*(n^2))  -R/((R+Rc)*n*Lm); R/((R+Rc)*n*C)  -1/((R+Rc)*C)];
B1=[1/(n*Lm)  -1/(n*Lm)  0  0 0; 0  0  0  0 0];
E1=[1  0; Rp/n  R/(R+Rc); 1/n  0];
F1=[0  0  0  0 0; 0  0  0  0 0; 0  0  0  0 0];

A2=[-Rp/(Lm*((n+1)^2))  -R/((n+1)*(R+Rc)*Lm); R/((n+1)*(R+Rc)*C)  -1/((R+Rc)*C)];
B2=[0  0  -1/((n+1)*Lm)  -1/(Lm*(n+1)) 0; 0  0  0  0 0];
E2=[1  0; Rp/(n+1)  R/(R+Rc); 0  0];
F2=[0  0  0  0  0; 0  0  0  0 0; 0  0  0  0 0 ];

                                                              % Definire domeniu ptr. curentul de sarcina 
U=[Vg; Vd1; Vd2;Vd3;2];
 D=fzero(@(D)model_med(D,A1,A2,B1,B2,E1,E2,F1,F2,U)-5, 0);
 [v0 ILm Is Mreal]=model_med(D,A1,A2,B1,B2,E1,E2,F1,F2,U);
  eta=Mreal(1,1)/D*(n+1)/(D+n)                                             % Calcul randament 
Rc=Rc+0.01
grid
plot(Rc,eta) 
grid

title('Randamnet functie ESR')
xlabel('ESR') 
ylabel('Randament')
hold on

end