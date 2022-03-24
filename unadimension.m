%Optimización
%Diana Valentina Uscategui Tobo
%Neider Puentes Sanchez
clear all;
clc;
syms x1 x2 xa e x dx;
i=0;

msj = 'Por favor digite la función del problema a optimizar: \n';
strr = input(msj,'s');
fun = str2func(['@(x)',strr]);
msj = 'Ingrese el valor de la cota superior: \n';
x1 = input(msj);
msj = 'Ingrese el valor de la cota inferior: \n';
x2 = input(msj);
msj = 'Ingrese el valor de la tolerancio del error: \n';
e = input(msj);

%Derivada de la función
dx= diff(fun,x,1); 
%decisión caso
prompt = 'digita mx para maximizar o mn para minizar, según sea su caso: \n';
str = input(prompt,'s');

%Caso maximización
if str=='mx'
    while true
        xa = (x2+x1)/2;
        d = double(subs(dx,{x},{xa}));
        i=i+1;
        %disp(d);
        if d>=0
            x2=xa;
        elseif d<=0
            x1=xa;
        end
        if (x1-x2)<=(2*e)
        break
        end
        fprintf('El Valor maximo es: %d\n', xa);
        fprintf('Se Realizaron : %d Iteraciones\n', i);
    end  
%Caso minimización
elseif str=='mn'
    while true
        %xa ->
        xa = (x2+x1)/2;
        d = double(subs(dx,{x},{xa}));
        i=i+1;
        %disp(d);
        if d>=0
            x1=xa;
        elseif d<=0
            x2=xa;
        end
        if (x1-x2)<=(2*e)
        break
        end
    end
    fprintf('El Valor minimo es: %d\n', xa);
    fprintf('Se Realizaron : %d Iteraciones\n', i);
else 
end
costo=double(subs(fun, {x}, xa));
fprintf('El costo es: %d\n', costo);