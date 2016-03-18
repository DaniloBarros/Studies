#include <stdio.h>
#include <stdlib.h>

//Ordem de complexidade T(1)
char substitui(char *v, char c , int pos){
	*(v+pos)=c;
}

int main(){
    int n, i;
    printf("Digite o tamanho do vetor: ");
    scanf("%d", &n);
    
	char frase[n];
    printf("Digite uma Frase: ");
    fflush(stdin);
    gets(frase);
    printf("Posicao: ");
	scanf("%d", &i);
	
	substitui(frase,'W',i);
	puts(frase);
}

