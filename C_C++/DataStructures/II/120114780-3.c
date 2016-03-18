#include<stdio.h>
#include<math.h>
int main(){
	
	printf("%s %s %s","O melhor algoritmo seria aquele com crescimento O(n^3), ja que, para um n grande",
				   "a demanda de processamento seria menor que O(2^n). Porem para n<10 a curva de  crescimento",
				   "de 2^n se encontra abaixo da curva de n^3, entao, para n pequenos,  O(2^n) e mais vantajoso.");
	
	float n,res,res1; n=1;
	printf("\n\nN^3\t\t2^n",n,res,n,res1);
	while((res!=res1) && n!=12){
		res=pow(n,3);
		res1=pow(2,n);
		printf("\n%0.f - %.2f\t%.2f",n,res,res1);
		n++;
	}
	return 0;
}

