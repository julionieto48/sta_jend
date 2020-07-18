clc , clear all , close all
%%
% *Codificacion Huffman Imagen - Julian Nieto * 
imagen = imread('imagen.jpg'); 
imagen = uint8(imagen);

rojo = imagen(: , : , 1); rojo = rojo(:);
verde = imagen(: , : , 2); verde = verde(:);
azul = imagen(: , : , 3); azul = azul(:);

conteo =  zeros(1 , 256) ; valor = 1 : 256 ;

cantidadApariciones= length(rojo)

for i = 1 : length(conteo) 
    % conteo( rojo(i) + 1 ) = conteo( rojo(i) + 1 ) + 1 ; 
    if ( rojo(i) == valor(i))
        conteo(i) = conteo(i) + 1 ;
    end
end

probRojo = zeros(1 , 256) ;
for i = 1 : length(probRojo)
    probRojo(i) = conteo(i) / cantidadApariciones;
end


%% codificacion
simbolos = 0:255 ;

diccRojo = huffmandict(simbolos,probRojo); 
compresionRojo = huffmanenco(simbolos,dict)


%%
% https://www.geeksforgeeks.org/image-compression-using-huffman-coding/
% https://www.mathworks.com/matlabcentral/answers/423105-huffman-encoding-for-image-compression
% https://www.mathworks.com/matlabcentral/answers/301011-if-a-is-a-matrix-a-produces-the-columns-in-a-vector-is-there-a-parallel-function-for-rows