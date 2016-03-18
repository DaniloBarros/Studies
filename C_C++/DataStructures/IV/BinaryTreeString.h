#include<stdio.h>
#include<stdlib.h>
#include<string.h>

#ifndef BINARY_TREE
#define BINARY_TREE
//Struct que guarda dados dos filmes
typedef struct TDados{
	char *Titulo;
	char *Midia;
	float Preco;
	char *Genero;
}Dados;

//Struct que aponta para structs filhas e os dados
//relacionados com o codigo
typedef struct T_Tree{
	struct T_Tree *Right;
	struct T_Tree *Left;
	char *data;
	struct TDados *dados;
}TreeNode;


//typedef struct TreeNode* Node;

TreeNode *Biuld(FILE *file, TreeNode *T);
void PrintTree(FILE *file, TreeNode *T);
void PreFixEsq(TreeNode *T);
TreeNode *Insert(char X[],TreeNode *T, Dados *data);
TreeNode *Delete(char X[],TreeNode *T);
TreeNode *Empty(TreeNode *T);
TreeNode *Find(char X[],TreeNode *T);
TreeNode *FindMin(TreeNode *T);
TreeNode *FindMax(TreeNode *T);
char *Retrieve(TreeNode *P);

#endif

//Funcao para imprimir os dados em ordem crescente
//em um arquivo externo
void PrintTree(FILE *file, TreeNode *T){
	if(T!=NULL){
		PrintTree(file,T->Left);
		fprintf(file,"%s ", T->data);
		fprintf(file,"%s ", T->dados->Titulo);		
		fprintf(file,"%s ", T->dados->Midia);
		fprintf(file,"%2.f ", T->dados->Preco);
		fprintf(file,"%s\n", T->dados->Genero);
		PrintTree(file,T->Right);
	}
}

//Funcao para imprimir os dados da arvore
//em ordem crescente
void PreFixEsq(TreeNode *T){
	if(T!=NULL){
		PreFixEsq(T->Left);
		printf("%s ",T->data);		
		PreFixEsq(T->Right);
	}
}

//Metodo para inserir uma certa string e struct de dados
//na arvore
TreeNode *Insert(char X[],TreeNode *T, Dados *data){
	
	//Se o No for nulo, aloque o no, inicialize
	//o codigo(data) e os dados, juntamente com
	//os filhos Nulos
	if(T==NULL){
		T = (TreeNode*)malloc(sizeof(TreeNode));
		T->data = X;
		T->dados = data;
		T->Left = NULL;
		T->Right = NULL;
		
	//Se X for menor que a informacao no No atual
	//va para a esquerda
	}else if(stricmp(X,T->data)<0 /*X<T->data*/)
		T->Left = Insert(X,T->Left,data);
	//Se X for maior que a informacao no No atual
	//va para a direita
	else if(stricmp(X,T->data)>0 /*X>T->data*/)
		T->Right = Insert(X,T->Right,data);
	//Se for igual nao faca nada
	else
		;
	return T;
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
		T->data = Tmp->data;
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

