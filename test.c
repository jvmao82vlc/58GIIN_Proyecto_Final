#include <stdio.h>
#include <locale.h>


int main()
{

    //Declaración Variables
    int x = 5;
    int y = 2;
    double decimal = 546.79;

    printf("Valor Decimal: %f \n", decimal);

    //Operaciones
    int suma;
    suma = 1 + 2;
    printf("Suma: %d \n",suma);

    int resta;
    resta = 3 - 2;
    printf("Resta: %d \n",resta);

    int mult;
    mult = 5 * 3;
    printf("Multiplicación: %d \n",mult);

    int div;
    div = 8 / 2;
    printf("División: %d \n",div);

    //Caracteres
    char letra = 'C';
    printf("Letra: %c \n", letra);  

    //Condiciones
    if (x != y) {
        int operacion = x * y;
        printf("Resultado: %i \n",operacion);
    }

    if (x > y && x > 0) {
        printf("X Mayor a Y \n");
    } else {
        printf("Resto Opciones \n");
    }

    
    //Bucles
    int i = 1;
    while (i <= 3) {
        printf("WHILE: %d \n", i);
        i++;
    }

    
    int inicio = 1;  
    do {  
        printf("DO: %d \n", inicio);  
        inicio++;  
    } while (inicio <= 3);  
    

    int valor;
    for (valor = 1; valor < 3; valor++) {
        printf("FOR: %d \n", valor);
    }

    return 0;
}