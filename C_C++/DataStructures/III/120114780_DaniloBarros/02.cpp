#include<stdio.h>
#include<stdlib.h>

#define L_FILA 7

/*TODO 
Arrumar Vazia()
Enfileirar primeiro elem
Desinfileirar ultimo/penultimo elemento
*/
struct TElem{
	int Id;
	long int End;
	long int tam;
	TElem *Prox;
	TElem *Ant;
};

struct TDelimitador{
	TElem *Ini;
	int qnt;
	TElem *Fin;
};

void menu(){
	puts("\n1 - Efileira");
	puts("2 - Desenfileira");
	puts("3 - Esvazia");
}

bool Vazia(TDelimitador *fila){
	if(fila->Ini==NULL){
		puts("Vazia!!");
		return true;
	}
	else{
		return false;
	}
}

bool Cheia(TDelimitador *fila){
	
	if(fila->qnt < L_FILA){
		return false;
	}else{
		puts("Cheia!!");
		return true;
	}
	
}

void Esvazia(TDelimitador *fila){
	fila=NULL;
}

bool Enfileira(TDelimitador *fila, int num){
	
	TElem *elem;
	long int end;
	puts("Digite o endereco:");
	fflush(stdin);
	scanf("%li", &end);
	
	elem = (TElem *) malloc(sizeof(TElem));
	
	if(!Vazia(fila)){
		
		if(!Cheia(fila)){
			elem->Prox = fila->Ini;
			elem->Id=num;
			elem->End = end;
			elem->tam = sizeof(TElem);
			elem->Ant = fila->Fin;
			fila->Fin->Prox = elem;
			fila->Fin = elem;
			fila->qnt += 1;
			return true;
						
		}else{
			return false;
		}
	}else{
		puts("Fila Iniciada!");
		elem->Prox = NULL;
		elem->Ant = NULL;
		elem->Id = num;
		elem->End = end;
		elem->tam = sizeof(TElem);
		fila->Ini = elem;
		fila->Fin = elem;
		fila->qnt = 1;
		return true;	
	}
	
}

TElem *Desenfileira(TDelimitador *fila){
	
	TElem *elem=NULL;
	
	if(!Vazia(fila)){
		
		elem = fila->Ini;
		fila->Ini->Prox->Ant = fila->Fin;
		fila->Fin->Prox = fila->Ini->Prox;
		fila->Ini = fila->Ini->Prox;
		fila->qnt -= 1;
		
		if(fila->qnt <= 0){
			Esvazia(fila);
		}
		
		return elem;
	}else{
		return elem;
	}
}

TElem *Consulta(TDelimitador *fila){
	
	TElem *elem=NULL;
	
	if(!Vazia(fila)){
		
		elem=fila->Fin;
		
		return elem;
		
	}else{
		
	}
}

int main(){
	TDelimitador *fila=NULL;
	TElem *elem;
	int op;
	
	do{
		menu();
		scanf("%d",&op);
		switch(op){
			case 1:
				int num;
				puts("Digite um identificador para enfileirar: ");
				scanf("%d",&num);
				Enfileira(fila,num);
				
				break;
			case 2:
				elem=Desenfileira(fila);			
				printf("\nElemento Desinfileirado: %d",elem->Id);
				break;
			case 3:
				Esvazia(fila);
				Vazia(fila);
				break;
			default:op=0;
				break;
			
		}
	}while(op!=0);
	
	
	return 0;
}

