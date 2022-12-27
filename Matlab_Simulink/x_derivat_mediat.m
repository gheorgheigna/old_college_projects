function f=x_derivat_mediat(t,X)

% Definirea valorilor elementelor din circuit
Vg=8; Vo=5; Iomax=2; Iomin=1; fs=80e3; Lm=200e-6; L2=185.1e-6; C=1e-3;
VD1=0.4; VD2=0.4; VD4=0.4; Rc=10e-3; Rg=10e-3; Ron=0.02;
n=0.96; io=2; D=0.52; R=2.5; 
Ts=1/fs;

% Definirea matricilor de stare
Ur=[Vg;VD1; VD2; VD4];
Rp=(R*Rc)/(R+Rc);
%Matricile de stare in stare ON(tranzistorul S3 si dioda D1 conduc, diodele
%D2 si D4 sunt blocate)

A1=[-(Ron+Rg+Rp)/(n^2*Lm) -R/(n*Lm*(R+Rc)); R/((R+Rc)*n*C) -1/((R+Rc)*C)];
B1=[1/(n*Lm) -1/(n*Lm) 0 0; 0 0 0 0];
E1=[1 0; Rp/n R/(R+Rc); 1/n 0];
F1=[0 0 0 0; 0 0 0 0; 0 0 0 0];

%Matricile de stare in starea OFF(tranzistorul S3 si dioda D1 blocate,
%diodele D2 si D4 conduc)

A2=[-Rp/((n+1)^2*Lm) -R/((n+1)*Lm*(R+Rc)); R/((n+1)*(R+Rc)*C) -1/((R+Rc)*C)];
B2=[0 0 -1/((n+1)*Lm) -1/((n+1)*Lm); 0 0 0 0];
E2=[1 0; Rp/(n+1) R/(R+Rc); 0 0];
F2=[0 0 0 0; 0 0 0 0; 0 0 0 0];
d=D;

Ad=d*A1+(1-d)*A2; 
Bd=d*B1+(1-d)*B2; 
Ed=d*E1+(1-d)*E2; 
Fd=d*F1+(1-d)*F2;

f=Ad*X+Bd*Ur;

end