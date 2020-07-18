clc , clear all , close all
%%
archivo = 'Dados colores'; datos = xlsread(archivo);  
imagen = imread('imagen2.png'); imagen = uint8(imagen);

simbolosAzul = datos(:,1); simbolosAzul = simbolosAzul.' ; % simbolosAzul = xlsread(archivo,BlueRange); 
simbolosRojo = datos(:,2);simbolosRojo = simbolosRojo.'; 
simbolosVerde = datos(:,3); simbolosVerde = simbolosVerde.';

totalEstados = 680; % length(simbolosAzul)

%%
% azul
conteoUno = 0; conteoDos = 0; conteoTres = 0; conteoCuatro = 0; conteoCinco = 0; conteoSeis = 0; conteoSiete = 0; conteoOcho = 0; conteoNueve = 0; conteoDiez = 0; conteoOnce = 0; conteoDoce = 0;

for i = 1 : totalEstados 
    if (simbolosAzul(i) == 1)
        conteoUno = conteoUno + 1; 
    elseif (simbolosAzul(i) == 2) 
        conteoDos = conteoDos + 1; 
    elseif (simbolosAzul(i) == 3) 
        conteoTres = conteoTres + 1; 
    elseif (simbolosAzul(i) == 4) 
        conteoCuatro = conteoCuatro + 1;
    elseif (simbolosAzul(i) == 5) 
        conteoCinco = conteoCinco + 1;
    elseif (simbolosAzul(i) == 6)
        conteoSeis = conteoSeis + 1; 
    elseif (simbolosAzul(i) == 7) 
        conteoSiete = conteoSiete + 1;
    elseif (simbolosAzul(i) == 8) 
        conteoOcho = conteoOcho + 1;
    elseif (simbolosAzul(i) == 9) 
        conteoNueve = conteoNueve + 1; 
    elseif (simbolosAzul(i) == 10) 
        conteoDiez = conteoDiez + 1;
    elseif (simbolosAzul(i) == 11) 
        conteoOnce = conteoOnce + 1; 
    elseif (simbolosAzul(i) == 12)
        conteoDoce = conteoDoce + 1;
    end
end

PUno = conteoUno / totalEstados; PDos = conteoDos / totalEstados; PTres = conteoTres / totalEstados; PCuatro = conteoCuatro / totalEstados; PCinco = conteoCinco / totalEstados; PSeis = conteoSeis / totalEstados; PSiete = conteoSiete / totalEstados; POcho = conteoOcho / totalEstados; PNueve = conteoNueve / totalEstados; PDiez = conteoDiez / totalEstados; POnce = conteoOnce/ totalEstados; PDoce = conteoDoce / totalEstados;

simbolos = 0:12;

pAzul = [0 PUno PDos PTres PCuatro PCinco PSeis PSiete POcho PNueve PDiez POnce PDoce];
dictAzul = huffmandict(simbolos,pAzul);

azul = imagen(: , : , 3); azul = azul(:); azul = (12 .* azul)/ 250;
%azul = azul(:);azul = azul(1:5224,1);length(azul);

compImagenAzul = huffmanenco(azul,dictAzul);
%fileID = fopen('blueCodedImage.txt',' w'); fwrite(fileID, char(compImagenAzul),'char');fclose(fileID);
filenameBlue = 'BluecodedHuffmanDataImageJulianNieto.xlsx'; xlswrite(filenameBlue,compImagenAzul);

%%
% verde
conteoUno = 0; conteoDos = 0; conteoTres = 0; conteoCuatro = 0; conteoCinco = 0; conteoSeis = 0; conteoSiete = 0; conteoOcho = 0; conteoNueve = 0; conteoDiez = 0; conteoOnce = 0; conteoDoce = 0;

for i = 1 : totalEstados 
    if (simbolosVerde(i) == 1)
        conteoUno = conteoUno + 1; 
    elseif (simbolosVerde(i) == 2) 
        conteoDos = conteoDos + 1; 
    elseif (simbolosVerde(i) == 3) 
        conteoTres = conteoTres + 1; 
    elseif (simbolosVerde(i) == 4) 
        conteoCuatro = conteoCuatro + 1;
    elseif (simbolosVerde(i) == 5) 
        conteoCinco = conteoCinco + 1;
    elseif (simbolosVerde(i) == 6)
        conteoSeis = conteoSeis + 1; 
    elseif (simbolosVerde(i) == 7) 
        conteoSiete = conteoSiete + 1;
    elseif (simbolosVerde(i) == 8) 
        conteoOcho = conteoOcho + 1;
    elseif (simbolosVerde(i) == 9) 
        conteoNueve = conteoNueve + 1; 
    elseif (simbolosVerde(i) == 10) 
        conteoDiez = conteoDiez + 1;
    elseif (simbolosVerde(i) == 11) 
        conteoOnce = conteoOnce + 1; 
    elseif (simbolosVerde(i) == 12)
        conteoDoce = conteoDoce + 1;
    end
end

PUno = conteoUno / totalEstados; PDos = conteoDos / totalEstados; PTres = conteoTres / totalEstados; PCuatro = conteoCuatro / totalEstados; PCinco = conteoCinco / totalEstados; PSeis = conteoSeis / totalEstados; PSiete = conteoSiete / totalEstados; POcho = conteoOcho / totalEstados; PNueve = conteoNueve / totalEstados; PDiez = conteoDiez / totalEstados; POnce = conteoOnce/ totalEstados; PDoce = conteoDoce / totalEstados;

simbolos = 0:12;

pVerde = [0 PUno PDos PTres PCuatro PCinco PSeis PSiete POcho PNueve PDiez POnce PDoce];
dictVerde = huffmandict(simbolos,pVerde);

verde = imagen(: , : , 2); verde = verde(:); verde = (12 .* verde)/ 250;
%azul = azul(:);azul = azul(1:5224,1);length(azul);

compImagenVerde = huffmanenco(verde,dictVerde);
%fileID = fopen('redCodedImage.txt',' wb'); fwrite(fileID, char(compImagenVerde),'char');fclose(fileID);
filenameGreen = 'GreenCodedHuffmanDataImageJulianNieto.xlsx'; xlswrite(filenameGreen,compImagenVerde);

%%
% verde
conteoUno = 0; conteoDos = 0; conteoTres = 0; conteoCuatro = 0; conteoCinco = 0; conteoSeis = 0; conteoSiete = 0; conteoOcho = 0; conteoNueve = 0; conteoDiez = 0; conteoOnce = 0; conteoDoce = 0;

for i = 1 : totalEstados 
    if (simbolosRojo(i) == 1)
        conteoUno = conteoUno + 1; 
    elseif (simbolosRojo(i) == 2) 
        conteoDos = conteoDos + 1; 
    elseif (simbolosRojo(i) == 3) 
        conteoTres = conteoTres + 1; 
    elseif (simbolosRojo(i) == 4) 
        conteoCuatro = conteoCuatro + 1;
    elseif (simbolosRojo(i) == 5) 
        conteoCinco = conteoCinco + 1;
    elseif (simbolosRojo(i) == 6)
        conteoSeis = conteoSeis + 1; 
    elseif (simbolosRojo(i) == 7) 
        conteoSiete = conteoSiete + 1;
    elseif (simbolosRojo(i) == 8) 
        conteoOcho = conteoOcho + 1;
    elseif (simbolosRojo(i) == 9) 
        conteoNueve = conteoNueve + 1; 
    elseif (simbolosRojo(i) == 10) 
        conteoDiez = conteoDiez + 1;
    elseif (simbolosRojo(i) == 11) 
        conteoOnce = conteoOnce + 1; 
    elseif (simbolosRojo(i) == 12)
        conteoDoce = conteoDoce + 1;
    end
end

PUno = conteoUno / totalEstados; PDos = conteoDos / totalEstados; PTres = conteoTres / totalEstados; PCuatro = conteoCuatro / totalEstados; PCinco = conteoCinco / totalEstados; PSeis = conteoSeis / totalEstados; PSiete = conteoSiete / totalEstados; POcho = conteoOcho / totalEstados; PNueve = conteoNueve / totalEstados; PDiez = conteoDiez / totalEstados; POnce = conteoOnce/ totalEstados; PDoce = conteoDoce / totalEstados;

simbolos = 0:12;

pRojo = [0 PUno PDos PTres PCuatro PCinco PSeis PSiete POcho PNueve PDiez POnce PDoce];
dictRojo = huffmandict(simbolos,pRojo);

rojo = imagen(: , : , 1); rojo = rojo(:); rojo = (12 .* rojo)/ 250;
%azul = azul(:);azul = azul(1:5224,1);length(azul);

compImagenRojo = huffmanenco(rojo,dictRojo);
%fileID = fopen('redCodedImage.txt',' w'); fwrite(fileID, char(compImagenRojo),'char');fclose(fileID);
filenameRed = 'RedCodedHuffmanDataImageJulianNieto.xlsx'; xlswrite(filenameRed,compImagenRojo);

%%
%filename = 'codedHuffmanDataImageJulianNieto.xlsx';
%datosCodificados = [compImagenRojo compImagenVerde compImagenAzul ];
%xlswrite(filename,datosCodificados);