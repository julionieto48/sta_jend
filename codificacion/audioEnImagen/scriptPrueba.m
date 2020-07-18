clc , clear all , close all ;
%%
archivoAudio = 'audio.wav'; archivoImagen = 'imagen.png';
datosAudio = audioread(archivoAudio); datosImagen = imread(archivoImagen);datosImagen = uint8(datosImagen);
% plot(datosAudio)
datosAudio = [datosAudio , datosAudio ] ; % convertir a stereo

%%
% _codificar el audio a imagen_
azul = datosImagen(:,:,3);     % valores de 0 a 255 -> reducir los datos para hacer diccionario
azulLowDic = reshape(azul' , [] , 1) ;
azulLowDic = 12 .* azul / 255 ;  %azulLowDic = reshape(azulLowDic' , [] , 1) ;


% contar la aparicion de elementos en la compoente azul
conteoCero = 0 ;conteoUno = 0; conteoDos = 0; conteoTres = 0; conteoCuatro = 0; conteoCinco = 0;
conteoSeis = 0; conteoSiete = 0; conteoOcho = 0; conteoNueve = 0; conteoDiez = 0;
conteoOnce = 0; conteoDoce = 0;
%_______________________________
for i = 1 : length(azulLowDic)

    if (azulLowDic(i) == 0)
        conteoCero = conteoCero + 1;
    elseif (azulLowDic(i) == 1)
        conteoUno = conteoUno + 1;
    elseif (azulLowDic(i) == 2)
        conteoDos = conteoDos + 1;
    elseif (azulLowDic(i) == 3)
        conteoTres = conteoTres + 1;
    elseif (azulLowDic(i) == 4)
        conteoCuatro = conteoCuatro + 1;
    elseif (azulLowDic(i) == 5)
        conteoCinco = conteoCinco + 1;
    elseif (azulLowDic(i) == 6)
        conteoSeis = conteoSeis + 1;
    elseif (azulLowDic(i) == 7)
        conteoSiete = conteoSiete + 1;
    elseif (azulLowDic(i) == 8)
        conteoOcho = conteoOcho + 1;
    elseif (azulLowDic(i) == 9)
        conteoNueve = conteoNueve + 1;
    elseif (azulLowDic(i) == 10)
        conteoDiez = conteoDiez + 1;
    elseif (azulLowDic(i) == 11)
        conteoOnce = conteoOnce + 1;
    elseif (azulLowDic(i) == 12)
        conteoDoce = conteoDoce + 1;
    end
end

cantidadApariciones = length(azulLowDic);
PCero = conteoCero / cantidadApariciones;
PUno = conteoUno / cantidadApariciones;
PDos = conteoDos / cantidadApariciones;
PTres = conteoTres / cantidadApariciones;
PCuatro = conteoCuatro / cantidadApariciones;
PCinco = conteoCinco / cantidadApariciones;
PSeis = conteoSeis / cantidadApariciones;
PSiete = conteoSiete / cantidadApariciones;
POcho = conteoOcho / cantidadApariciones;
PNueve = conteoNueve / cantidadApariciones;
PDiez = conteoDiez / cantidadApariciones;
POnce = conteoOnce/ cantidadApariciones;
PDoce = conteoDoce / cantidadApariciones;

pTot = PCero + PUno + PDos + PTres + PCuatro + PCinco + PSeis + PSiete + POcho + PNueve + PDiez + POnce + PDoce ; % debe ser 1

% _Diccionario_
simbolos = 0:12 ;
pAzul = [PCero PUno  PDos PTres  PCuatro  PCinco  PSeis  PSiete  POcho  PNueve  PDiez  POnce  PDoce] ;
diccionarioAzul = huffmandict(simbolos,pAzul);


% |codificar el Audio|

% convertir los valores de audio a valores entre 0 y 12 como audio esta
% entre -1 y 1 llevar de 0 a 2
datosAudio = datosAudio + 1 ; datosAudio = datosAudio .* 12 / 2 ;

datosAudioLeft  = round(datosAudio(:,1)) ; % tomar las componentes de la matriz
datosAudioRight = round(datosAudio(:,2)) ;

compAudioLeft  = huffmanenco(datosAudioLeft , diccionarioAzul) ; compAudioLeft = compAudioLeft.' ;
compAudioRight = huffmanenco(datosAudioRight , diccionarioAzul); compAudioRight = compAudioRight.' ;

%%
% _reconstruir imagen con las componentes_

%pad = zeros( size(datosImagen , 1) , size(datosImagen , 2) , 'uint8' ) ;
%lengthRed = length( azulLowDic ) * 3 ; redZeros = zeros( lengthRed -
%length(datosAudioLeft) );  red = reshape(datosAudioLeft,[300,300])  % no
%funciona pq es mas grande

% blue = cat(3,pad,pad,azul); imshow(blue) %azul es 300 x 300
%%
% byte = compAudioLeft (1,[1:8])  
% base = 2.^[length(byte)-1 : -1 : 0]
% valor = sum(byte.*(base))
%%
% contador = 1 ; 
% lefValoresRed = [] ; % length(compAudioLeft) / 8
% compAudioLeftAuxiliar = zeros( length(compAudioLeft) / 8);
% for i = 1 : length(compAudioLeft) / 8
%     
%     byte = compAudioLeft (1,[1:8]) 
%     compAudioLeft(i) = compAudioLeftAuxiliar(i)
%     compAudioLeft(i) = compAudioLeft(i - 8)
%     if mod(contador, 8)  == 0                 % al llegar  a 8 se reinicia
%         contador = 0 ;    
%     end
%     contador = contador + 1 ;
% end

%%
% convertir a arreglo de correspondientes de bytes
base = 2.^[length(primerValor)-1:-1:0];


primerValorRed = compAudioLeft(1, [1:8]);
primerValorRed = sum(primerValorRed.*(base));

red = [primerValorRed (zeros(1,(length(compAudioLeft)-8)/8))]

for i = 2 : (length(compAudioLeft)/8) +1
    if i > length(compAudioLeft)/8
        break
    end
    red(:,i) = sum(compAudioLeft((i-1)*8+1: i * 8).* base);
end