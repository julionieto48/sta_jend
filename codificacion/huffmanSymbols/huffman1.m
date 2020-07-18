clc , clear all , close all
format short
%%
% _ encontrar las probabilidades _ 
archivo = 'simbolosAciertos'; datos = xlsread(archivo);

simbolos = datos(:,1); simbolos = simbolos.';    % simbolos = datos([2:7 ],1)

aciertos = datos(:,2); aciertos = aciertos.';    % cantidad de vece sque acerto un simbolo

intentos = 0 ; % es la sumatoria de todoslos aciertos

for i = 1 : length(aciertos)
    intentos = aciertos(i)  + intentos;
end

% para encontrar la probabilidad aciertos / intentos

p_j = [];

for j = 1 : length(simbolos)
    p_j(j) = aciertos(j) / intentos;
end

%%
% _ordenar las probabilidades _
% ordenamiento por burbuja mayor porb a menor prob

% for i  = 1 : length(p_j) 
%     
%     for j = 1 : length(p_j) 
%         
%         if p_j(j) < p_j(j + 1)   % numero actual < numero siguiente
%             
%             aux = p_j(j);
%             p_j(j) = p_j(j + 1);
%             p_j(j + 1) = aux;
%         end
%         
%     end
%     
% end





%%
% *huffman por matlab*

diccionario = huffmandict(simbolos, p_j);   % crea el diccionario

compresion = huffmanenco(simbolos , diccionario);



%%
% _dada una imagen_
% codificar sus componentes rgb con el diccionario generado
imagen = imread('imagen2.png'); imagen = uint8(imagen) ; % valores de 0 a 255

red = imagen(:,:,1) ; green = imagen(:,:,2) ; blue = imagen(:,:,3);

pad = zeros(size(imagen,1), size(imagen,2) , 'uint8' );

red = cat(3,pad,pad,red) ; green = cat(3,pad,green,pad) ; blue = cat(3,blue,pad,pad) ;

% a cada valor de 0 a 255 hacerle un valor correspondiente de 1 a 6 (simbolos)

red = (6.* red)/ 255 ; green = (6.* green)/ 255 ; blue = (6.* blue)/ 255 ;

%%
% _comprimir la imagen_
imagenComprimidaRojo = huffmanenco(red(:) , diccionario);


%%
% _descomprimir la imagen_
imagenRojo= huffmandeco(imagenComprimidaRojo , diccionario); imshow(imagenRojo);



