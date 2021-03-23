clear variables
close all
clc

%Determinaremos el gradiente promedio para el mes de enero y julio
falic = xlsread("temp_media_alicahue2.xlsx"); %Temperatura diaria en estacion alicahue
fcond = xlsread("temp_media_los_condores2.xlsx"); %temperatura diaria en estacion condores
%fp tiene forma:
% (dia   mes   año   temperatura_alicahue    temperatura_condores)
[m1,n1] = size(falic); %m1-1 = cantidad de dias considerado para alicahue
[m2,n2] = size(fcond); %m2-1 = cantidad de días considerados para condores
m = min(m1,m2); %para que pare en el límite del primero
altitud_condores = 190; %msnm
altitud_alicahue = 750; %msnm
cant_dias = zeros(12,1);
gradientes_meses = zeros(12,1);
ignorados = 0;
for i = 2:m1
    if(i == min(m1,m2) || i == min(m1,m2)) %Si es que llegó a la cantidad máxima de una de las dos
        break       %paramos
    end
    for k = 2:m2
        if(k > m2 || k > m1)
            break
        end
        if(falic(i,2) == fcond(k,2) && falic(i,3) == fcond(k,3)) %solo si es el mismo mes y día
            gradiente_dia = -(falic(i,4)-fcond(i,4))/(altitud_alicahue-altitud_condores);
            if gradiente_dia > 0 %si es positivo
                ignorados = ignorados + 1;
                continue;                               
                %Lo ignoramos
            end
            for j = 1:12 %para guardar la cantidad de días para cada mes
                if(fcond(k,2) == j && falic(k,2) == j)
                    cant_dias(j,1) = cant_dias(j,1) + 1; %cantidad de días para cada mes
                    gradientes_meses(j,1) =  gradientes_meses(j,1) + gradiente_dia; %suma de gradientes para cada mes
                end
            end
        end
    end
end

%por lo tanto el promedio
promedio_gradientes_meses = zeros(12,1);
for i=1:12
    promedio_gradientes_meses(i,1) = promedio_gradientes_meses(i,1) + gradientes_meses(i,1)/cant_dias(i,1);
end    
    
promedio_gradiente_enero = promedio_gradientes_meses(1,1);
promedio_gradiente_julio = promedio_gradientes_meses(7,1);
porc_ignorados = (ignorados/(m1*m2))*100;
%Para mostrar los gradientes quitar los comentarios de todo lo de abajo
disp("El porcentaje de ignorados es:");
disp(porc_ignorados);
disp("Promedio de gradientes todos los meses");
disp(promedio_gradientes_meses);
disp("Promedio de Gradiente en Enero = ");
disp(promedio_gradiente_enero);
disp("Promedio Gradiente en Julio = ");
disp(promedio_gradiente_julio);