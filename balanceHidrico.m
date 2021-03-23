clear variables
close all
clc

eto_p = xlsread("evapotranspiracion_puntos_anio_hidrologico.xlsx");
prec_p = xlsread("Puntos_Prec_CR2.xlsx");
[me,ne] = size(eto_p);
[mp,np] = size(prec_p); %mp debería ser igual que me ya que se comparan ambos puntos
bh = NaN(me,12); % balance hídrico, si existe, lo rellena, si no, lo deja NaN

for i = 1:me %para recorrer los puntos de evapotranspiración
    for j = 1:mp %para recorrer los puntos de precipitacion
        if(eto_p(i,1) == prec_p(j,1) && eto_p(i,2) == prec_p(j,2)) %solo si son las mismas coordenadas
            for k = 1:12 %para recorrer los meses 
                bh(i,k) = prec_p(j,k+4) - eto_p(i,k+4); % balance hídrico en el punto para todos los meses (por el ciclo for)
            end
        end
    end
end

[mb,nb] = size(bh);
bh_mensual = zeros(12,1)
for i = 1:me
    for j = 1:12
        bh_mensual(j,1) = bh_mensual(j,1) + bh(i,j); %el balance hídrico del mes
    end
end

xlswrite("balance_hidrico.xlsx",bh);
disp("El balance hídrico mensual es:");
disp(bh_mensual);