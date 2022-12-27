clear all; close all; clc;

Tsim=[0 4e-3];
x0=[0; 0];

OPTIONS = odeset('MAXSTEP',50e-9);
[t,x_comutat] = ode45('x_comutat_derivat_perturbat',Tsim,x0,OPTIONS);


vc_comutat=x_comutat(:,1); 
plot(t,vc_comutat, 'r'), grid on; title('Tensiune de iesire perturbat');     % Afisare tensiune de iesire perturbat
xlabel('t'); ylabel('V0 [V]');