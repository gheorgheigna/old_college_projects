function [v0, ILm, Is, Mreal]=model_med(D,A1,A2,B1,B2,E1,E2,F1,F2,U);
% Returneaza solutia de stare stationara a modelului mediat
% Parametrii functiei model_med:
%                               D- factor de umplere
%                               A1-F1 - matr. de stare ptr. starea
%                               topologica 1 (S-conduce)
%                               A2-F2 - matr. de stare ptr. starea
%                               topologica2 (S-blocat)
%                               U - vector intrare

AD=D*A1+(1-D)*A2;
BD=D*B1+(1-D)*B2;
ED=D*E1+(1-D)*E2; 
FD=D*F1+(1-D)*F2;

Y=(FD-ED*inv(AD)*BD)*U;
Mreal=FD-ED*inv(AD)*BD;

v0=Y(2);
ILm=Y(1);
Is=Y(3);