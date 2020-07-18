clc, clear all, close all
%%
% 00 01 101 1100 01 101 00 01 01 11011 01 01 01 111 111 00 111 10 1111 00
% 01 100

symbolos = 1:8;
probabilidad = [0.35 0.25 0.12 0.1 0.08 0.06 0.03 0.01];

dict = huffmandict(symbolos,probabilidad); % genera el diccionario 

sig = [0 0 0 1 1 0 1 1 1 0 0 0 1 1 0 1 0 0 0 1 0 1 1 1 0 1 1 0 1 0 1 0 1 1 1 1 1 1 1 0 0 1 1 1 1 0 1 1 1 1 0 0 0 1 1 0 0]; % secuencia codificada

hcode = huffmandeco(sig,dict)