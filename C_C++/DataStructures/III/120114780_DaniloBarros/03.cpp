#include<stdio.h>
#include<stdlib.h>

struct TPilha{
	TPilha *Prox;
	long int End;
	int Qnt;
};

bool Vazia(TPilha *pilha){
	if(pilha->Qnt==-1){
		puts("Pilha Vazia");
		return true;
	}else
		return false;
}

bool Empilhamento(TPilha *pilha){
	
	TPilha *novaPilha;
	
	long int end;
	puts("Digite o endereco:");
	fflush(stdin);
	scanf("%li", &end);
	
	novaPilha = (TPilha *) malloc(sizeof(TPilha));
	
	if(!Vazia(pilha)){
		novaPilha->Prox=pilha;
		novaPilha->Qnt=pilha->Qnt + 1;
		novaPilha->End=end;
		pilha=novaPilha;
		return true;
	}else{
		novaPilha->Prox=NULL;
		novaPilha->Qnt=1;
		novaPilha->End=end;
		pilha=novaPilha;
		return true;
	}
	
}

TPilha* Desempilhamento(TPilha *pilha){
	TPilha *novaPilha;
	
	if(!Vazia(pilha)){
		novaPilha = pilha;
		if(pilha->Prox!=NULL){
			pilha->Prox->Qnt=pilha->Qnt;
			pilha=pilha->Prox;
			pilha->Qnt-=1;	
		}else{
			pilha=NULL;
		}
	}else{
		novaPilha = (TPilha *) malloc(sizeof(TPilha));
	}
	return novaPilha;
	
}

int main(){
	TPilha *pilha;
	pilha->Qnt=-1;
	return 0;
}
