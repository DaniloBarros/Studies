#include<stdio.h>
#include<stdlib.h>

struct TLista{
	TLista *Ant;
	int cod;
	char *nome;
	TLista *Prox;
};

void menu(){
	puts("\n\t1 - Incluir depois da chave");
	puts("\t2 - Excluir chave");
	puts("\t3 - Listar agenda");
	puts("\t0 - Sair");
}

bool Vazia(TLista *pLista){
	if(pLista == NULL)
		return true;
	else
		return false;
}
/*
TLista *Inclui(TLista *pLista, int cod){
	
	TLista *pNovoNo, *pAux;
	char nome[30];
	
	puts("Digite um nome:");
	fflush(stdin);
	gets(nome);
	
	if(!Vazia(pLista)){
		pNovoNo = (TLista *) malloc(sizeof(TLista));
		pNovoNo->cod = cod;
		pNovoNo->nome = nome;
		
		pNovoNo->Prox = pLista;
		pLista->Ant = pNovoNo;
		
		pAux = pLista;
		
		if(pLista->Prox!=NULL){			
			
			while(pAux->Prox!=pLista){
				pAux = pAux->Prox;
			}
			
			pNovoNo->Ant = pAux;
			pAux->Prox=pNovoNo;
			//pLista->Ant=pNovoNo;
		}else{
			pLista->Prox=pNovoNo;
			pNovoNo->Ant=pLista;
		}
		
		
	}else{
		puts("Lista Iniciada!");
		pNovoNo = (TLista *) malloc(sizeof(TLista));
		pLista = pNovoNo;
		pLista->cod = cod;
		pLista->nome = nome;
		pLista->Ant = NULL;
		pLista->Prox = NULL;
	}
	return pLista;
}
*/

TLista *IncluiDepois(TLista *pLista, int pChave){
	TLista *pNovoNo, *pAux;
	
	char nome[30];
	
	puts("Digite um nome:");
	fflush(stdin);
	gets(nome);
	
	if(!Vazia(pLista)){
		pNovoNo = (TLista *) malloc(sizeof(TLista));
		pNovoNo->cod = pChave;
		pNovoNo->nome = nome;
		
		pAux = pLista;	
		
		if(pLista->Prox!=NULL){
			
			//TODO ERRO
				
			while (pAux->cod != pChave){
				
				if(pAux->Prox==pLista){
					puts("Chave nao encontrada");
					break;	
				}else
					pAux = pAux->Prox;
			}
			
			
			if(pAux->cod==pChave){
				pNovoNo->Ant=pAux;
				pNovoNo->Prox=pAux->Prox;
				pAux->Prox->Ant=pNovoNo;
				pAux->Prox=pNovoNo;
				
			}
		
		}else{
			if(pLista->cod==pChave){
				
			}else
				puts("Chave nao encontrada");
		}
	
	}else
		puts("Lista Vazia!");
		
	return pLista;
}

TLista *ExcluiChave(TLista *pLista, int pChave){
	TLista *pAux;
	
	if(!Vazia(pLista)){
		if(pLista->Prox!=NULL){
			pAux = pLista;
			
			while (pAux->cod != pChave){
				
				if(pAux==pLista){
					puts("Chave nao encontrada");
					break;	
				}else
					pAux = pAux->Prox;
			}
			
			if(pAux->cod==pChave){
				
				if(pAux->Prox->Prox != pAux){
					pAux->Ant->Prox = pAux->Prox;
					pAux->Prox->Ant = pAux->Ant;
				}else{
					pLista=pAux->Prox;
					pLista->Prox=NULL;
					pLista->Ant=NULL;
				}
					
				free(pAux);
			}
		}else{
			if(pLista->cod==pChave){
				pLista=NULL;
			}else
				puts("Chave nao encontrada");
		}
	}else
		puts("Lista Vazia!");
		
	return pLista;
}

int main(){
	TLista *pLista = NULL;
	int op, cod;
	
	do{
		menu();
		scanf("%d",&op);
		switch(op){
			case 1:
				puts("Digite um codigo");
				fflush(stdin);
				scanf("%d", &cod);
				IncluiDepois(pLista,cod);				
				break;
			case 2:
				puts("Digite um codigo");
				fflush(stdin);
				scanf("%d", &cod);
				ExcluiChave(pLista, cod);
				break;
			case 3:puts("Lista:");
				TLista *aux;
				aux = pLista;
				if(!Vazia(aux)){
					//printf("\n%d",aux->Numero);
					while(aux!=NULL){
						printf("\n%d",aux->cod);
						puts(aux->nome);
						aux=aux->Prox;
					}
				}else puts("Lista Vazia!");
				break;
			default:
				op=0;
		}
		
	}while(op!=0);
	
	return 0;
}

