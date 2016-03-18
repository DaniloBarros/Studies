#include<stdio.h>

int i=0;

double T(double n){
	//printf("\t%.2f",n);
	i++;
	if(n<=1){
		return 1;
	}else {
		return (2*T(n/2)+n);
	}
}

int main(){
	
	double x=0,n;
	
	scanf("%lf", &n);
	
	x=T(n);
	
	printf("\nT(n)= %lf\nN de chamadas: %d",x,i);
	
	return 0;
}

