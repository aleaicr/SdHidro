clear all
close all
clc

precs = xlsread('precipitaciones.xlsx');
[mp,np] = size(precs);
FX = zeros(mp,1); % F(x) Probabilidad de No Excedencia

alfa = 2.59075;
beta = 33;
gamma = -51.191933;
Tb = 2.6313*10^35;

syms x 
f = (1/(abs(alfa)*Tb))*((x-gamma)/alfa)^(beta-1)*exp((-1/alfa)*(x-gamma)); %f(x)

for i = 1:mp
    FX(i,1) = int(f,0,precs(i,1)); %Rellenando F(x)
end
