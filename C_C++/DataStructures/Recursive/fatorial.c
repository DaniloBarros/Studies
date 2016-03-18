#include <stdio.h>

long fatorial(unsigned int numero)
{
	if (numero == 0)
		return 1;
	else 
		return numero*fatorial(numero - 1);
}

int main()
{
	long resultado;
	int numero;
	
	printf("Insira um numero positivo: ");
	scanf("%d", &numero);
	
	resultado = fatorial(numero);
	
	printf("%d! = %ld\n", numero, resultado);
	
	return 0;
}

