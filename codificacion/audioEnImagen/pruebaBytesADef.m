clc, clear all

x = [1 0 0 1 0 0 1 1 0 0 0 0 0 0 0 1 1 0 0 1 0 0 1 1 0 0 0 0 0 0 0 1] ;
primerValor = x(1, [1:8]);

base = 2.^[length(primerValor)-1:-1:0];
primerValor = sum(primerValor.*(base));

xNew = [primerValor (zeros(1,(length(x)-8)/8))]


for i = 2: (length(x)/8) +1
    if i > length(x)/8
        break
    end
    xNew(:,i) = sum(x((i-1)*8+1: i * 8).* base)
end