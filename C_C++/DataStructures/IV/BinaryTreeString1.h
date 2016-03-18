#include<stdio.h>
#include<stdlib.h>
#include<string.h>

#ifndef BINARY_TREE
#define BINARY_TREE
//Struct que guarda dados dos filmes
typedef struct TDados{
	char Titulo[100];
	char Midia[10];
	float Preco;
	char Genero[50];
}Dados;

//Struct que aponta para structs filhas e os dados
//relacionados com o codigo
typedef struct T_Tree{
	struct T_Tree *Right;
	struct T_Tree *Left;
	char data[8];//codigo
	
	//Ponteiro que tem como finalidade
	//Linkar o codigo da arvore com o
	//Bloco de dados armazenados em TDados
	struct TDados *dados;
}TreeNode;

void ImpCresc(TreeNode *T);
void *Insert(char X[],TreeNode **T, Dados *data);
TreeNode *Delete(char X[],TreeNode *T);
TreeNode *Empty(TreeNode *T);
TreeNode *Find(char X[],TreeNode *T);
TreeNode *FindMin(TreeNode *T);
TreeNode *FindMax(TreeNode *T);
char *Retrieve(TreeNode *P);

#endif

//Funcao para imprimir os dados da arvore
//em ordem crescente
void ImpCresc(TreeNode *T){
	if(T!=NULL){
		ImpCresc(T->Left);
		printf("%s %s %s %2.f %s\n", T->data, T->dados->Titulo,T->dados->Midia, T->dados->Preco, T->dados->Genero);		
		ImpCresc(T->Right);
	}
}

//Metodo para inserir uma certa string e struct de dados
//na arvore
void *Insert(char X[],TreeNode **T, Dados *data){
	
	//Se o No for nulo, aloque o no, inicialize
	//o codigo(data) e os dados, juntamente com
	//os filhos Nulos
	
	if(*T==NULL){
		TreeNode *aux;
		aux = (TreeNode*)malloc(sizeof(TreeNode));
	
		strcpy(aux->data, X);
	
		aux->dados = data;
	
		aux->Left = aux->Right = NULL;
	
		*T = aux;
		
		
	//Se X for menor que a informacao no No atual
	//va para a esquerda
	}else if(strcmp(X,(*T)->data)<0 /*X<T->data*/){
		Insert(X,&(*T)->Left,data);
	//Se X for maior que a informacao no No atual
	//va para a direita
	}else if(strcmp(X,(*T)->data)>0 /*X>T->data*/){
		Insert(X,&(*T)->Right,data);
	//Se for igual nao faca nada
	}else
		;
}

//Deletar um no
TreeNode *Delete(char X[],TreeNode *T){
	TreeNode *Tmp;
	
	if(T==NULL)
		;
	else if(X < T->data)
		T->Left = Delete(X,T->Left);
	else if(X > T->data)
		T->Right = Delete(X,T->Right);
	else if(T->Left!=NULL && T->Right!=NULL){
		Tmp = FindMin(T->Right);
		strcpy(T->data, Tmp->data);
		T->Right = Delete(T->data,T->Right);
	}else{
		Tmp = T;
		
		if(T->Left==NULL)
			T = T->Right;
		else if(T->Right==NULL)
			T = T->Left;
		
		free(Tmp);
	}
	return T;
}
//Esvaziar uma arvore
TreeNode *Empty(TreeNode *T){
	if(T!=NULL){
		Empty(T->Left);
		Empty(T->Right);
		free(T);
	}
	return NULL;
}

//Encontre um no, dado uma informacao
TreeNode *Find(char X[],TreeNode *T){
	if(T==NULL)
		return NULL;
	else if(X < T->data)
		return Find(X,T->Left);
	else if(X > T->data)
		return Find(X,T->Right);
	else
		return T;
}

//Ache o minimo
TreeNode *FindMin(TreeNode *T){
	if(T!=NULL){
		while(T->Left!=NULL)
			T=T->Left;
	}
	return T;
}

//Ache o maximo
TreeNode *FindMax(TreeNode *T){
	if(T==NULL)
		return NULL;
	else if(T->Right==NULL)
		return T;
	else
		return FindMax(T->Right);
}

//Retorne o dado de um no
char *Retrieve(TreeNode *P){
	return P->data;
}

