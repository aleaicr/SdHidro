close all
clear all
clc

%Abrir el excel para leer los datos%
A = xlsread('swe_diario.xlsx');
[m,n] = size(A); %m = #Filas, n = #Columnas
%Inicializamos los datos
anio_inicial = 1996; %Año inicial de los datos
anio_final = 2015; %Año final de los datos
%Inicialización de arrays/vectores
prec_anual = zeros(anio_final-anio_inicial+1,1);
dias_en_anios = zeros(anio_final-anio_inicial+1,1);
%Rellenamos arrays/vectores de análisis mensual
%Rellenamos arrays/vectores de análisis anual
for i = 2:m
    for j = 0:anio_final-anio_inicial
        if (A(i,3) == j + anio_inicial)
            prec_anual(j+1,1) = prec_anual(j+1,1) + A(i,4);
            dias_en_anios(j+1,1) = dias_en_anios(j+1,1) + 1;
        end
    end
end

%Calculamos el promedio Anual
promedioprec_anual = zeros(anio_final-anio_inicial,1);
totalprec_anual = 0;
for j = 0:anio_final-anio_inicial
    promedioprec_anual(j+1,1) = prec_anual(j+1,1)/dias_en_anios(j+1,1);
    totalprec_anual = totalprec_anual + prec_anual(j+1,1);
end

%print datos anual
disp("Promedio de evaporacion anual:")
disp(promedioprec_anual)
disp("El último que da 0.0000 se debe a la baja cantidad de días del último año");
disp("Total de evaporacion anual:")
disp(prec_anual)
disp("Dias considerados para cada año:")
disp(dias_en_anios)
disp("Total de evaporacion en la zona[mm]:")
disp(totalprec_anual)