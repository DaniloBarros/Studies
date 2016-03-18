#include<stdlib.h>
#ifndef BINARY_TREE
#define BINARY_TREE

typedef struct T_Tree{
	struct T_Tree *Right;
	struct T_Tree *Left;
	int data;
}TreeNode;

//typedef struct TreeNode* Node;

TreeNode *Biuld(FILE *file, TreeNode *T);
void PrintTree(FILE *file, TreeNode *T);
void PreFixEsq(TreeNode *T);
TreeNode *Insert(int X,TreeNode *T);
TreeNode *Delete(int X,TreeNode *T);
TreeNode *Empty(TreeNode *T);
TreeNode *Find(int X,TreeNode *T);
TreeNode *FindMin(TreeNode *T);
TreeNode *FindMax(TreeNode *T);
int Retrieve(TreeNode *P);

#endif

TreeNode *Biuld(FILE *file, TreeNode *T){
	int num;
	while(fscanf(file,"%d",&num) != EOF){
		T=Insert(num,T);
	}
	return T;
}

void PrintTree(FILE *file, TreeNode *T){
	if(T!=NULL){
		fprintf("%d", Retrieve(T));
		PrintTree(file,T->Left);
		PrintTree(file,T->Right);
	}
}

void PreFixEsq(TreeNode *T){
	if(T!=NULL){
		printf("%d ",T->data);
		PreFixEsq(T->Left);
		PreFixEsq(T->Right);
	}
}

TreeNode *Insert(int X,TreeNode *T){
	if(T==NULL){
		T = (TreeNode*)malloc(sizeof(TreeNode));
		T->data = X;
		T->Left = NULL;
		T->Right = NULL;
	}else if(X<T->data)
		T->Left = Insert(X,T->Left);
	else if(X>T->data)
		T->Right = Insert(X,T->Right);
	else
		;
	return T;
}

TreeNode *Delete(int X,TreeNode *T){
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

TreeNode *Empty(TreeNode *T){
	if(T!=NULL){
		Empty(T->Left);
		Empty(T->Right);
		free(T);
	}
	return NULL;
}

TreeNode *Find(int X,TreeNode *T){
	if(T==NULL)
		return NULL;
	else if(X < T->data)
		return Find(X,T->Left);
	else if(X > T->data)
		return Find(X,T->Right);
	else
		return T;
}

TreeNode *FindMin(TreeNode *T){
	if(T!=NULL){
		while(T->Left!=NULL)
			T=T->Left;
	}
	return T;
}

TreeNode *FindMax(TreeNode *T){
	if(T==NULL)
		return NULL;
	else if(T->Right==NULL)
		return T;
	else
		return FindMax(T->Right);
}

int Retrieve(TreeNode *P){
	return P->data;
}

