clear all
close all
clc
%% MÉTODO DE THORNWAITE HOLTZMANN

%% Importando archivo de temperaturas, tiene formato [año, dia, mes, temperatura]
temps = xlsread("nombre_archivo_temperaturas.xlsx");
[mt,nt] = size(temps); %mt = 4 ; nt = cantidad de años + 1
% Temperaturas serán diarias

%% Promedio Histórico de Temperaturas
tot_temps = zeros(12,1); %vector del total (sumas) de temperaturas
cant_temps = zeros(12,1); %vector de la cantidad de días que se consideraron para cada mes
for i = 1:nt
    for j = 1:12
        if(temps(i+1,3) == j)
            tot_temps(j,1) = tot_temps(1,j) + temps(i+1,4);
            cant_temps(j,1) = cant_temps(1,j) + 1;
        end
    end
end

%por lo tanto el promedio
prom_temps = zeros(12,1);
for i = 1:12
    prom_temps(i,1) = tot_temps(i,1)/cant_temps(i,1); % PROMEDIO mensual de temperaturas
end

%% Cálculo de IC
int IC = 0;
for i = 1:12
    IC = IC + (prom_temps(i,1)/5)^1.514;
end

%% Cálculo de a
a = 6.75*10^-7*IC^3 - 7.71*10^-5*IC^2 + 1.792*10^-2*IC + 0.049239;

%% Cálculo de d
%primero calculo de N: número de horas de sol
%N =;
d = zeros(12,30)
for i = 1:12
    for dia = 1:30
        d(i,dia) = N/12 * dia/30; %me falta N
    end
end

%% Cálculo de la evapotranspiración mensual
evapo = zeros(12,1);
for i = 1:12
    for j = 1:30
        evapo(i,1) = 16*d(i,j)*(10*prom_temps(i,1)/IC)^a;
    end
end

%% Evapotranspiración total
evapo_tot = 0;
for i = 1:12
    evapo_tot = evapo_tot + evapo(i,1);
end

disp("La evapotranspiración media mensual es:")
disp(evapo);
disp("La Evapotransipración total es:")
disp(evapo_tot);