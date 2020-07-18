clc, clear all, close all
% %%
% imagen = imread('image.png');
% imagenB =uint8(imagen) ; % valores de 0 a 255
% 
% 
% % extraer info RGB
% red = imagenB(:,:,1) 
% green = imagenB(:,:,2); 
% blue = imagenB(:,:,3);
% 
% pad = zeros(size(imagenB, 1), size(imagenB, 2), 'uint8');
% 
% red = cat(3, red, pad, pad);
% green = cat(3,pad, green, pad);
% blue = cat(3, pad, pad, blue);

% imshow(red);imshow(green);imshow(blue);
%%
imagen = imread('image.png');
imagenB =uint8(imagen) ; % valores de 0 a 255
% 
% 
%extraer info RGB
red = imagenB(:,:,1);
green = imagenB(:,:,2); 
blue = imagenB(:,:,3);
% 
pad = zeros(size(imagenB, 1), size(imagenB, 2), 'uint8');
% 
[fila,columna] = size(imagenB);
noise = randi([0,255],[1080,1920]); noise = uint8(noise) ;

red = cat(3, red, pad, pad);
green = cat(3,pad, green, pad);
blue = cat(3, pad, pad, blue);

%imagen con ruido en su componente
noiseRed = cat(3,noise,pad,pad);
noiseGreen = cat(3,pad,noise,pad);
noiseBlue = cat(3,pad,pad,noise);

% imshow(red);imshow(green);imshow(blue);
% imshow(noise);

% anadir componente de ruido en una parte
imgFinalRed = cat(3,noiseRed(:,:,1),green(:,:,2),blue(:,:,3));
%imshow(imgFinalRed);


%%
% del excel anadir esos valores

num = xlsread('Dados colores');
num = uint8( num * 255 / 12 );

% tomar los componentes
redNum = num(:,1);
greenNum = num(:,2);
blueNum = num(:,3);

% escalar los componentes
redNum = reshape(redNum,20,34);
greenNum = reshape(greenNum,20,34);
blueNum = reshape(blueNum,20,34);


% imagen
img = cat(3, redNum, greenNum, blueNum);
imwrite(img, 'imagenGeneradaDados.png');
imshow(img)








