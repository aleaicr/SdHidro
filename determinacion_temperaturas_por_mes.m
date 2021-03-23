clear all
close all
clc

%luego de tener el gradiente, hay que determinar la temperatura
%en cada punto en cada día

%primero importamos los puntos
pts = xlsread("coordenadasyelevacion.xlsx"); %   longitud    latitud     pto     altitud
grads = xlsread("gradientes_por_mes.xlsx"); %gradientes de cada mes
alt_condores = 190;%msnm
[m1,n1] = size(pts);
%Los siguientes vectores de temperaturas se obtuvieron con el archivo
%det_prom_condores_enero_julio.m
temp_condores_enero = [18.6067;18.8154;18.5214;18.6333;18.8267;18.9067;18.8786;19.0429;19.1067;19.0867;19.4467;19.5143;19.6571;19.7929;19.6867;18.8733;18.4600;18.0071;18.1071;17.7214;17.5000;17.6538;17.6071;18.1286;18.8462;18.5231;18.6750;18.6308;18.4846;19.7167;19.5923];
temp_condores_julio = [8.6400;11.6538;10.1000;9.5933;8.9467;8.1667;9.6286;9.1857;9.6133;10.1000;10.2533;11.5357;11.9714;12.4929;9.2067;10.7200;10.8067;10.4000;9.7786;9.4286;12.0417;10.8538;9.8214;11.4000;11.5538;12.2077;13.0500;13.4769;11.6077;11.9667;12.4846];
temperaturas_2_enero = zeros(m1,31);
temperaturas_2_julio = zeros(m1,31);
%Para Enero
for i = 1:m1-1 %recorriendo los puntos
    for j = 1:31 %recorriendo las temperaturas T_1 (T2 = -gradiente*(h2-h1) + T1), H1 = 190, T1 = temp_condores_enero o julio
        temperaturas_2_enero(i,j) = -gradiente_enero*(pts(i+1,4)-alt_condores) + temp_condores_enero(j,1);
    end
end
%Para Julio
for i = 1:m1-1 %recorriendo los puntos
    for j = 1:31 %recorriendo las temperaturas T_1 (T2 = -gradiente*(h2-h1) + T1), H1 = 190, T1 = temp_condores_enero o julio
        temperaturas_2_julio(i,j) = -gradiente_julio*(pts(i+1,4)-alt_condores) + temp_condores_julio(j,1);
    end
end
%Quitar los comentarios apra que genere los archivos y muestre en pantalla
%los resultados
xlswrite("temperatura_por_puntos_y_dias_enero.xlsx",temperaturas_2_enero);
xlswrite("temperatura_por_puntos_y_dias_julio.xlsx",temperaturas_2_julio);
disp("Temperaturas de cada punto en distintos días en Enero");
disp(temperaturas_2_enero);
disp("Temperaturas de cada punto en distintos días en Julio");
disp(temperaturas_2_julio);
