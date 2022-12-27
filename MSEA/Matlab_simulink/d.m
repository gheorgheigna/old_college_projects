% d.) Calcula?i cu ajutorul comenzii TRIM care este factorul de
%     umplere în punctul de func?ionare corespunz?tor unui curent de 2A
clear all; close all; clc;


%------------Definire valorilor a elementelor din circuit-----------------
clear all; close all; clc;
syms D
Vo=5; Vg=8; Rg=10e-3; Rc=10e-3; Lm=200e-6; L2=185.1e-6; C=100e-6 ; 
Vd=0.4 ;fs=80e3; n=sqrt(L2/Lm); Ts=1/fs;
R=2.5; Ron=0.02; v0=5; ILm=1.2692; Is=0.6928;
Rp=(R*Rc)/(R+Rc);



A1=[-(Ron+Rg+Rp)/(n^2*Lm) -R/(n*Lm*(R+Rc)); R/((R+Rc)*n*C) -1/((R+Rc)*C)];
B1=[1/(n*Lm) -1/(n*Lm) 0 0; 0 0 0 0];
C1=[1 0; Rp/n R/(R+Rc); 1/n 0];
D1=[0 0 0 0; 0 0 0 0; 0 0 0 0];

%Matricile de stare in starea OFF(tranzistorul S3 si dioda D1 blocate,
%diodele D2 si D4 conduc)

A2=[-Rp/((n+1)^2*Lm) -R/((n+1)*Lm*(R+Rc)); R/((n+1)*(R+Rc)*C) -1/((R+Rc)*C)];
B2=[0 0 -1/((n+1)*Lm) -1/((n+1)*Lm); 0 0 0 0];
C2=[1 0; Rp/(n+1) R/(R+Rc); 0 0];
D2=[0 0 0 0; 0 0 0 0; 0 0 0 0];



           
[X,U,Y,dx] = trim('L4_eu1');                         % calculeaza intrarile cu restrictii la matricile de stare ptr modelul L4_eu 
                                                                            % in acest caz v0=5 nu poate varia, y0 u0 conditii initiale

D_trim=U           %valoarea lui D pt I0=20A rezultata din trim

