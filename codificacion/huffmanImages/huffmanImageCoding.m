clc , clear all , close all
%%
% *Codificacion Huffman Imagen - Julian Nieto * 

imagen = imread('imagen.jpg'); 
imagen = imagen(:);                  % transponer
imagen = rgb2gray(imagen);            % pasar a escala de grises
[m,n] = size(imagen)                 % n columnas m filas

contador = 0:255 ;                  % valores posible

for i = 1 : m  
    for i = 1 : n
        contador( imagen(i,j) + 1)  =  contador( imagen(i,j) + 1) + 1 ;
    end
end
contador



% https://www.mathworks.com/matlabcentral/answers/423105-huffman-encoding-for-image-compression