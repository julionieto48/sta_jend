clc, clear all, close all
format short

%%
% del excel anadir esos valores
archivo = 'Dados Colores A'
datos = xlsread(archivo);

% son estados del Experimento
BlueRange = 'A1:A680'; % tomado de la hoja de calculo
simbolosAzul = datos(:,1); simbolosAzul = simbolosAzul.' ; % simbolosAzul = xlsread(archivo,BlueRange);
simbolosRojo = datos(:,2);simbolosRojo = simbolosRojo.';
simbolosVerde = datos(:,3); simbolosVerde = simbolosVerde.';

totalEstados = 680; % length(simbolosAzul)
% contar aparicion elementos
conteoUno = 0; conteoDos = 0; conteoTres = 0; conteoCuatro = 0; conteoCinco = 0;
conteoSeis = 0; conteoSiete = 0; conteoOcho = 0; conteoNueve = 0; conteoDiez = 0;
conteoOnce = 0; conteoDoce = 0;

% en azul
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

% definir la probabilidad aparicion / estados

% en azul
PUno = conteoUno / totalEstados;
PDos = conteoDos / totalEstados;
PTres = conteoTres / totalEstados;
PCuatro = conteoCuatro / totalEstados;
PCinco = conteoCinco / totalEstados;
PSeis = conteoSeis / totalEstados;
PSiete = conteoSiete / totalEstados;
POcho = conteoOcho / totalEstados;
PNueve = conteoNueve / totalEstados;
PDiez = conteoDiez / totalEstados;
POnce = conteoOnce/ totalEstados;
PDoce = conteoDoce / totalEstados;

% verificar probabbilidades
pTot = PUno + PDos + PTres + PCuatro + PCinco + PSeis + PSiete + POcho + PNueve + PDiez + POnce + PDoce;

%%
simbolos = 1:12; 
pAzul = [PUno  PDos PTres  PCuatro  PCinco  PSeis  PSiete  POcho  PNueve  PDiez  POnce  PDoce];

%%
% hacer diccionario
dictAzul = huffmandict(simbolos,pAzul);
%%
% codificar
compAzul = huffmanenco(simbolosAzul,dictAzul);

%%
% encontrar informacion azul I = - log2(pi)
IUno = -log2(PUno);IDos = -log2(PDos); ITres = -log2(PTres);ICuatro = -log2(PCuatro);
ICinco = -log2(PCinco);ISeis = -log2(PSeis); ISiete = -log2(PSiete);IOcho = -log2(POcho);
INueve = -log2(PNueve); ;IDiez = -log2(PDiez); IOnce = -log2(POnce); IDoce = -log2(PDoce);

infoAzul = [IUno PUno  PDos PTres  PCuatro  PCinco  PSeis  PSiete  POcho  PNueve  PDiez  POnce  PDoce ];

%%
% calculo entropia  Iraya = suma(pi * Ii)

for i = 1 : 12
    HAzul = infoAzul(i) * pAzul(i) ;
end
HAzul
% HAzul = -sum(p.*log2(p));