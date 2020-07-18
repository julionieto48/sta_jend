clc, clear all, close all
%%
arreglo = [1,2,3,4,5,6,7,8]
dato = 4 ;estado = 0;
inf = 1; sup = length(arreglo);

i = 1;
while (inf <= length(arreglo) )
    mitad = (sup + inf) / 2;
    
    if arreglo(i) == dato
        estado = 1;
    end
    
    if arreglo(i) > dato
        sup = mitad;
        mitad = (sup + inf) / 2;
        
    end
    
     if arreglo(i) < dato
        inf = mitad;
        mitad = (sup + inf) / 2;
        
    end
    %i = i + 1;
end