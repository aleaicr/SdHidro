clear variables
close all
clc

temps = xlsread("tmean_cr2met_mon.xlsx");
[mtp,npt] = size(temps); %mtp cantidad de meses incluídos en el análisis
%notar: mtp/12  = cantidad de años hidrológicos
DiaJuliano = [15; 46; 74; 106; 136; 167; 197; 228; 259; 289; 320; 350];
cantDiasporMes = [31;28;31;30;31;30;31;31;30;31;30;31];
latitud = 1;
longitud = 1;

%% IC
IC_mes = zeros(mtp,1);
for i = 1:mtp
    IC_mes(i,1) = IC_mes(i,1) + (abs(temps(i,2)/5))^1.514;
end

%% a
a_mes = zeros(mtp,1);
for i = 1:mtp
    a_mes(i,1) = 6.75*10^-7*IC_mes(i,1)^3 -7.71*10^-5*IC_mes(i,1)^2 +1.792*10^-2*IC_mes(i,1) +0.49239;
end

%% delta_medio
delta_medio = zeros(mtp,1); %vector de los delta
for i = 1:mtp
    for j = 1:12
        if(temps(i,1) == j)
            delta_medio(i,1) = 23.45*(pi/180)*cos(2*pi/(365*(172-DiaJuliano(j,1))));
        end
    end
end

%% Calculo H para cada mes
H_mes = zeros(mtp,1);
for i = 1:mtp
    H_mes(i,1) = acosd(tand(latitud)*tand(delta_medio(i,1)));
end

%% Cálculo de N
t_set = zeros(mtp,1);
t_rise = zeros(mtp,1);
N = zeros(mtp,1);
for i = 1:mtp
    t_set(i,1) = 12 + H_mes(i,1)/15;
    t_rise(i,1) = 12 - H_mes(i,1)/15;
    N(i,1) = t_set(i,1) - t_rise(i,1);
end

%% Cálculo de d
d = zeros(mtp,1);
for i = 1:mtp
    for j = 1:12
        if(temps(i,1) == j)
            d(i,1) = N(i,1)*cantDiasporMes(j,1)/(12*30);
        end
    end
end

%% Cálculo Evapotranspiración
ETo = zeros(mtp,1);
ETo_total = 0;

for i = 1:mtp
    ETo(i,1) = 16*d(i,1)*(abs(10*temps(i,2)/IC_mes(i,1)))^a_mes(i,1);
    ETo_total = ETo_total + ETo(i,1);
end

xlswrite("evapotranspiracion_cr2met",ETo);
disp(ETo);
disp(ETo_total);




