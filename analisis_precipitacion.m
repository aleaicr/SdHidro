close all
clear all
clc

%Abrir el excel para leer los datos%
A = xlsread('precipitaciones_petorca_cr2.xlsx');
[m,n] = size(A); %m = #Filas, n = #Columnas
%Inicializamos los datos
anio_inicial = 2003; %Año inicial de los datos
anio_final = 2019; %Año final de los datos
%Inicialización de arrays/vectores
prec_mensual = zeros(12,1);
dias_en_mes = zeros(12,1);
prec_anual = zeros(anio_final-anio_inicial+1,1);
dias_en_anios = zeros(anio_final-anio_inicial+1,1);
%Rellenamos arrays/vectores de análisis mensual
for i = 2:m
    for j = 1:12
        if (A(i,2) == j)
            prec_mensual(j,1) = prec_mensual(j,1) + A(i,4);
            dias_en_mes(j,1) = dias_en_mes(j,1) + 1;
        end
    end
end
%Rellenamos arrays/vectores de análisis anual
for i = 2:m
    for j = 0:anio_final-anio_inicial
        if (A(i,1) == j + anio_inicial)
            prec_anual(j+1,1) = prec_anual(j+1,1) + A(i,4);
            dias_en_anios(j+1,1) = dias_en_anios(j+1,1) + 1;
        end
    end
end

% Calculamos el promedio mensual
promedioprec_menusual = zeros(12,1);
totalprec_mensual = 0;
for j = 1:12
    promedioprec_menusual(j,1) = prec_mensual(j,1)/dias_en_mes(j,1);
    totalprec_mensual = totalprec_mensual + prec_mensual(j,1);
end
%Calculamos el promedio Anual
promedioprec_anual = zeros(anio_final-anio_inicial,1);
totalprec_anual = 0;
for j = 1:16
    promedioprec_anual(j,1) = prec_anual(j,1)/dias_en_anios(j,1);
    totalprec_anual = totalprec_anual + prec_anual(j,1);
end

%Print datos mensual, quitar comentarios para ver los resultados
% disp("Promedio de precipitación mensual: ")
% disp(promedioprec_menusual)
% disp("Total de precipitaciones mensual:")
% disp(prec_mensual)
% disp("Días considerados para cada mes:")
% disp(dias_en_mes)
% disp("Total de precipitación en la zona [mm]:")
% disp(totalprec_mensual)
% %print datos anual
% disp("Promedio de precipitación anual:")
% disp(promedioprec_anual)
% disp("Total de precipitaciones anual:")
% disp(prec_anual)
% disp("Dias considerados para cada año:")
% disp(dias_en_anios)
% disp("Total de precipitación en la zona[mm]:")
% disp(totalprec_anual)