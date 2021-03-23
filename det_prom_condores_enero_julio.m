clear all
close all
clc

%Temperatura media para cada día de enero en los cóndores
fcond = xlsread("temp_media_los_condores.xlsx");
[m,n] = size(fcond);
prom_temps_enero_condores = zeros(31,1);
temps_enero_condores = zeros(31,1); %
dias_enero_condores = zeros(31,1);  %cuenta la cantidad de días n de enero en todo el archivo

prom_temps_febrero_condores = zeros(31,1);
temps_febrero_condores = zeros(31,1); %
dias_febrero_condores = zeros(31,1);  %cuenta la cantidad de días n de enero en todo el archivo

prom_temps_marzo_condores = zeros(31,1);
temps_marzo_condores = zeros(31,1); %
dias_marzo_condores = zeros(31,1);  %cuenta la cantidad de días n de enero en todo el archivo

prom_temps_abril_condores = zeros(31,1);
temps_abril_condores = zeros(31,1); %
dias_abril_condores = zeros(31,1);  %cuenta la cantidad de días n de enero en todo el archivo

prom_temps_mayo_condores = zeros(31,1);
temps_mayo_condores = zeros(31,1); %
dias_mayo_condores = zeros(31,1);  %cuenta la cantidad de días n de enero en todo el archivo

prom_temps_junio_condores = zeros(31,1);
temps_junio_condores = zeros(31,1); %
dias_junio_condores = zeros(31,1);  %cuenta la cantidad de días n de enero en todo el archivo

prom_temps_julio_condores = zeros(31,1);
temps_julio_condores = zeros(31,1); %
dias_julio_condores = zeros(31,1);  %cuenta la cantidad de días n de enero en todo el archivo

prom_temps_agosto_condores = zeros(31,1);
temps_agosto_condores = zeros(31,1); %
dias_agosto_condores = zeros(31,1);  %cuenta la cantidad de días n de enero en todo el archivo

prom_temps_septiembre_condores = zeros(31,1);
temps_septiembre_condores = zeros(31,1); %
dias_septiembre_condores = zeros(31,1);  %cuenta la cantidad de días n de enero en todo el archivo

prom_temps_octubre_condores = zeros(31,1);
temps_octubre_condores = zeros(31,1); %
dias_octubre_condores = zeros(31,1);  %cuenta la cantidad de días n de enero en todo el archivo

prom_temps_noviembre_condores = zeros(31,1);
temps_noviembre_condores = zeros(31,1); %
dias_noviembre_condores = zeros(31,1);  %cuenta la cantidad de días n de enero en todo el archivo

prom_temps_diciembre_condores = zeros(31,1);
temps_diciembre_condores = zeros(31,1); %
dias_diciembre_condores = zeros(31,1);  %cuenta la cantidad de días n de enero en todo el archivo


for i = 1:m
    %% Enero
    if (fcond(i,2)==1) %si es enero
        for j = 1:31
            if (fcond(i,3)==j)
                temps_enero_condores(j,1) = temps_enero_condores(j,1) + fcond(i,4);
                dias_enero_condores(j,1) = dias_enero_condores(j,1) + 1;
            end
        end
    end
    %% Febrero
    if (fcond(i,2)==2) %si es febrero
        for j = 1:31
            if (fcond(i,3)==j)
                temps_febrero_condores(j,1) = temps_febrero_condores(j,1) + fcond(i,4);
                dias_febrero_condores(j,1) = dias_febrero_condores(j,1) + 1;
            end
        end
    end
    %% Marzo
    if (fcond(i,2)==3) %si es febrero
        for j = 1:31
            if (fcond(i,3)==j)
                temps_marzo_condores(j,1) = temps_marzo_condores(j,1) + fcond(i,4);
                dias_marzo_condores(j,1) = dias_marzo_condores(j,1) + 1;
            end
        end
    end
    %% Abril
    if (fcond(i,2)==4) %si es febrero
        for j = 1:31
            if (fcond(i,3)==j)
                temps_abril_condores(j,1) = temps_abril_condores(j,1) + fcond(i,4);
                dias_abril_condores(j,1) = dias_abril_condores(j,1) + 1;
            end
        end
    end
    %% Mayo
    if (fcond(i,2)==5) %si es febrero
        for j = 1:31
            if (fcond(i,3)==j)
                temps_mayo_condores(j,1) = temps_mayo_condores(j,1) + fcond(i,4);
                dias_mayo_condores(j,1) = dias_mayo_condores(j,1) + 1;
            end
        end
    end
    %% Junio
    if (fcond(i,2)==6) %si es febrero
        for j = 1:31
            if (fcond(i,3)==j)
                temps_junio_condores(j,1) = temps_junio_condores(j,1) + fcond(i,4);
                dias_junio_condores(j,1) = dias_junio_condores(j,1) + 1;
            end
        end
    end
    %% Julio
    if (fcond(i,2)==7) %si es julio
        for j = 1:31
            if (fcond(i,3)==j)
                temps_julio_condores(j,1) = temps_julio_condores(j,1) + fcond(i,4);
                dias_julio_condores(j,1) = dias_julio_condores(j,1) + 1;
            end
        end
    end
    %% Agosto
    if (fcond(i,2)==8) %si es julio
        for j = 1:31
            if (fcond(i,3)==j)
                temps_agosto_condores(j,1) = temps_agosto_condores(j,1) + fcond(i,4);
                dias_agosto_condores(j,1) = dias_agosto_condores(j,1) + 1;
            end
        end
    end
    %% Septiembre
    if (fcond(i,2)==9) %si es julio
        for j = 1:31
            if (fcond(i,3)==j)
                temps_septiembre_condores(j,1) = temps_septiembre_condores(j,1) + fcond(i,4);
                dias_septiembre_condores(j,1) = dias_julio_condores(j,1) + 1;
            end
        end
    end
end
for i=1:31
    prom_temps_enero_condores(i,1) = prom_temps_enero_condores(i,1) + temps_enero_condores(i,1)/dias_enero_condores(i,1);
    prom_temps_julio_condores(i,1) = prom_temps_julio_condores(i,1) + temps_julio_condores(i,1)/dias_enero_condores(i,1);
end
xlswrite
disp("Promedio de temperaturas de los Condores en Enero");
disp(prom_temps_enero_condores);
disp("Promedio de temperaturas de los Condores en Julio");
disp(prom_temps_julio_condores);