clc , clear all , close all;
format long
%%
archivo = 'imsound.png'; datosImagen = uint8(imread(archivo));

rojo = datosImagen(:,:,1) ; verde = datosImagen(:,:,2) ; azul = datosImagen(:,:,3); 
% rojo = rojo(:) ; verde = verde(:);azul = azul(:);
rojo = reshape(rojo',[],1);verde = reshape(verde',[],1);azul = reshape(azul',[],1); % azul no tiene audio
% pasar valores de 0 a 1 "normalizar"
%  con  x = 1 * (valor arreglo)  / 255

% rojo = double(rojo  ./ 255) ; verde = double(verde  ./ 255) ;azul = azul ./ 255 ;

% pasar a valor entre -1 y 1 
% (arreglo * 2 ) -> se escala entre 0 y 2
% (arreglo * 2 ) -1 

%%
% rojo = ( ((rojo .* 2) / 255 ) * 2 ) - 1 ; rojo = double(rojo) ; %rojo = rojo.' ;
% verde = ( ((verde .* 2) / 255 ) * 2 ) - 1 ; verde = double(verde) ; %razul = azul.' ;
%%
rojo = rojo.* 1 / 255; % valor de uint imagen a sonido
rojo = (rojo .* 2 ) - 1 ; rojo = double(rojo);

verde = verde.* 1 / 255; % valor de uint imagen a sonido
verde = (verde .* 2 ) - 1 ; verde = double(verde);
%%
stereoSenal = [ rojo , verde ] - 0.25 ;
%sound(stereoSenal,44100,24);
audiowrite('senalStereo.wav',stereoSenal,44100);

%plot(stereoSenal) ;
% sound(rojo,44100,24);
% audiowrite('monoVert.wav',rojo,44100);
