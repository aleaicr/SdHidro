clear variables
close all
clc

temps_p = xlsread("temperaturas_con_datos_cr2met.xlsx"); %temperatura media mensual del año hidrológico para cada punto
%formato [longitud latitud punto altura temp_enero_85 temp_feb_85 ... temp_abril_84 .... temp_diciembre_84]
[mtp,ntp] = size(temps_p); %cantidad de puntos = mtp, ntp = 16

%se tendrá que calcular la evapotranspiración por cada punto y se deberá
%sumar para obtener el total de la cuenca
DiaJuliano = [15; 46; 74; 106; 136; 167; 197; 228; 259; 289; 320; 350];
cantDiasporMes = [31;28;31;30;31;30;31;31;30;31;30;31];

%% Cálculo de IC para cada punto
IC_puntos = zeros(mtp,12); %vector de IC para cada punto
for i =  1:mtp
    for j = 1:12
       IC_puntos(i,j) = IC_puntos(i,j) + (abs(temps_p(i,j+4)/5))^1.514;
    end
end

%% Cálculo de a para cada punto
a_puntos = zeros(mtp,12); %vector de a para cada punto;
for i = 1:mtp
    for j=1:12
        a_puntos(i,j) = 6.75*10^-7*IC_puntos(i,j)^3 -7.71*10^-5*IC_puntos(i,j)^2 +1.792*10^-2*IC_puntos(i,j) +0.49239;
    end
end

%% Calculo delta medio del mes para cada punto
delta_medio = zeros(12,1); %vector de los delta
for j = 1:12
    delta_medio(j,1) = 23.45*(pi/180)*cos(2*pi/(365*(172-DiaJuliano(j,1))));
end

%% Calculo H para cada punto
H_puntos = zeros(mtp,12);
for i = 1:mtp
    for j = 1:12
        H_puntos(i,j) = acosd(tand(temps_p(i,2))*tand(delta_medio(j,1)));
    end
end

%% Cálculo de N
t_set_puntos = zeros(mtp,12);
t_rise_puntos = zeros(mtp,12);
N = zeros(mtp,12);
for i = 1:mtp
    for j = 1:12
        t_set_puntos(i,j) = 12 + H_puntos(i,j)/15;
        t_rise_puntos(i,j) = 12 - H_puntos(i,j)/15;
        N(i,j) = t_set_puntos(i,j) - t_rise_puntos(i,j);
    end
end

%% Cálculo de d para cada punto
d_puntos = zeros(mtp,12);
for i = 1:mtp
    for j = 1:12
        d_puntos(i,j) = N(i,j)*cantDiasporMes(j,1)/(12*30);
    end
end

%% Cálculo de Evapotranspiración
ETo = zeros(mtp,12);
ETo_total = zeros(12,1);
for i = 1:mtp-1
    for j = 1:12
        ETo(i,j) = 16*d_puntos(i,j)*(abs(10*temps_p(i,j+4)/IC_puntos(i,j)))^a_puntos(i,j); %Evapotranspiración para cada punto para cada mes
        ETo_total(j,1) = ETo_total(j,1) + ETo(i,j); %Suma de toda la evapotranspiración 
    end
end

xlswrite("evapotranspiracion_punto_mes_cr2met.xlsx",ETo);
eto2 = ETo_total*1/(1986*10^6); %evapotranspiración media medida para un m^2
%cuadrado de la cuenca
disp("ETo:")
disp(ETo); % Evapotrancipiración para cada punto para cada mes en mm^2/mes
disp("ETo_total:")
disp(ETo_total); %evapotranspiración total para la cuencia en mm^2/mes en 950km^2
disp("ETo promedio (ETo_total/Area_Cuenca):")
disp(eto2);

%% FIN







