


def busquedabinaria(arreglo,valor):

    def recursion(min, max):
        medio = int( (min + max) / 2 )

        if y[medio] == valor:
            print(medio)
        if y[medio] > valor:  # esta en la primera mitad
            recursion(min , medio -1)
        if y[medio] < valor:  # esta en la primera mitad
            recursion(medio -1, max)

    recursion(0 , len(arreglo) - 1)


y = [1,2,3,4,5,6,7] ; valor = 2

busquedabinaria(y,valor);
