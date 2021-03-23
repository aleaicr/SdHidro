clear all
close all
clc

%luego de tener el gradiente, hay que determinar la temperatura
%en cada punto en cada día

%primero importamos los puntos
pts = xlsread("coordenadasyelevacion.xlsx"); %   longitud    latitud     pto     altitu
temps_alic = xlsread("temperatura_media_mes_alicahue.xlsx"); % temperaturas medias (extraídas con excel)
grads = xlsread("gradientes.xlsx"); % matriz [mes gradientes] gradientes negativos, meses 1,2,3...
alt_alicahue = 750; %msnm
[m1,n1] = size(pts);
%Los siguientes vectores de temperaturas se obtuvieron con el archivo
%det_prom_condores_enero_julio.m
temperaturas = zeros(m1-1,12);

for i = 1:m1-1
    for j = 1:12
        temperaturas(i,j) = -grads(j+1,2)*(alt_alicahue-pts(i+1,4) + temps_alic(j+1,2);
    end
end


%Quitar los comentarios apra que genere los archivos y muestre en pantalla
%los resultados
xlswrite("temperaturas_por_puntos_por_mes.xlsx",temperaturas);
disp(temperaturas);
