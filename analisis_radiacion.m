clear all
close all
clc

coords = xlsread("coordenadasyelevacion.xlsx");
temps_enero  = xlsread("temperatura_por_puntos_y_dias_enero.xlsx");
temps_julio  = xlsread("temperatura_por_puntos_y_dias_julio.xlsx");
[me,ne] = size(temps_enero); %me : cantidad de puntos para enero
[mj,nj] = size(temps_julio); %mj : cantidad de puntos para julio
[mc,n] = size(coords); %mc=mj=me
boltz = 5.67*10^(-8); %W/(m^2k^4) constante de boltzman
e_s = 0.95; %Emisividad superficial
e_atm_enero = 0.799; %Emisividad Atmosférica
e_atm_julio = 0.723;
wo = 1367; %W/m^2
phi_ref = -75; %Latitud Referencial
rswd_enero = zeros(mc,31); %rwsd para cada punto
rlwa_enero = zeros(me,31); %rlwa para cada punto
rlwd_enero = zeros(me,31); %lwd para cada punto

%Para enero (mes de verano)

%Radiación de onda corta
for i = 1:mc %recorre los puntos
    phi = coords(i,2) ;
    tau = (-75 - phi)*pi/180;
    for j = 1:31 %recorre los días de enero
        %sin_alfa = sin(delta)*sin(phi) + cos(delta)*cos(phi)*cos(tau)
        delta = (23.45*pi/180)*cos((2*pi/365)*(172-j));%angulo de declinación solar
        sin_alfa = sin(delta)*sin(phi) + cos(delta)*cos(phi)*cos(tau);
        rswd_enero(i,j) = wo*sin_alfa;  %Matriz de rwsd para cada punto y día (filas=>puntos, columnas =>días)
    end       
end

%Radiación de onda Larga
for i = 1:me
    for j = 1:31
    rlwa_enero(i,j) = boltz*e_s*((temps_enero(i,j)+273.15)*1.20)^4; %1.20 ya que es 20% superior a la del aire
    rlwd_enero(i,j) = boltz*e_atm_enero*(temps_enero(i,j)+273.15)^4;
    end
end

%Radiación neta
rneta_enero = rswd_enero + rlwa_enero + rlwd_enero;

prom_temperaturas = zeros(12,31);
suma_temperaturas = zeros(12,31);
cant_dias = zeros(12,31);

%Para julio (mes de invierno)
rswd_julio = zeros(mc,31); %rwsd para cada punto
rlwa_julio = zeros(mj,31); %rlwa para cada punto
rlwd_julio = zeros(mj,31); %lwd para cada punto

%Radiación de onda corta
for i = 1:mc %recorre los puntos
    phi = coords(i,2) ;
    tau = (-75 - phi)*pi/180;
    for j = 182:212 %recorre los días de enero
        %sin_alfa = sin(delta)*sin(phi) + cos(delta)*cos(phi)*cos(tau);
        delta = (23.45*pi/180)*cos((2*pi/365)*(172-j));%angulo de declinación solar
        sin_alfa = sin(delta)*sin(phi) + cos(delta)*cos(phi)*cos(tau);
        rswd_julio(i,j-181) = wo*sin_alfa;  %Matriz de rwsd para cada punto y día (filas=>puntos, columnas =>días)
    end       
end

%Radiación de onda larga
for i = 1:me
    for j = 1:31
    rlwa_julio(i,j) = boltz*e_s*((temps_julio(i,j)+273.15)*1.20)^4; %1.20 ya que es 20% superior a la del aire
    rlwd_julio(i,j) = boltz*e_atm_julio*(temps_julio(i,j)+273.15)^4;
    end
end

%Radiación neta 
rneta_julio = rswd_julio + rlwa_julio + rlwd_julio;

%quitar el comentario a todo lo de abajo para que retorne los resultados y el excel
disp("Enero");
disp("Radiación de onda Corta,enero");
disp(rswd_enero);   xlswrite("rswd_enero.xlsx",rswd_enero);
disp("Radiación de onda larga ascendente,enero");
disp(rlwa_enero);   xlswrite("rlwa_enero.xlsx",rlwa_enero);
disp("Radiación de onda larga descendente,enero");
disp(rlwd_enero);   xlswrite("rlwd_enero.xlsx",rlwd_enero);
disp("Radiación Neta Enero");
disp(rneta_enero);  xlswrite("rneta_enero.xlsx",rneta_enero);
disp("Julio");
disp("Radiación de onda Corta,julio");
disp(rswd_julio);   xlswrite("rswd_julio.xlsx",rswd_julio);
disp("Radiación de onda larga ascendente,julio");
disp(rlwa_julio);   xlswrite("rlwa_julio.xlsx",rlwa_julio);
disp("Radiación de onda larga descendente,julio");
disp(rlwd_julio);   xlswrite("rlwd_julio.xlsx",rlwd_julio);
disp("Radiación Neta Julio");
disp(rneta_julio);  xlswrite("rneta_julio.xlsx",rneta_julio);