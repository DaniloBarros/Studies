#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include"BinaryTreeString1.h"

FILE *arquivoE, *arquivoS;

//Metodo para gravar em um arquivo os
//Dados, ordenados, presentes na Arvore
//Binaria
void Print(FILE *file, TreeNode *T){
	if(T!=NULL){
		Print(file,T->Left);
		fprintf(file,"%s %s %s %2.f %s\n", T->data, T->dados->Titulo,
			T->dados->Midia, T->dados->Preco, T->dados->Genero);
		Print(file,T->Right);
	}
}

void menu(){
	puts("\n1 - Carregar dados de um arquivo");
	puts("2 - Limpar dados");
	puts("3 - Imprimir dados ordenados");
	puts("4 - Achar o Maximo");
	puts("5 - Achar o Minimo");
	puts("6 - Gravar dados em um arquivo");
	puts("7 - Limpar Tela");
	puts("0 - Sair");
}

int main(){
	//Inicializacao das variaveis
	TreeNode *root=NULL;
	Dados *data=NULL;
	char narq[100], buffer[1000];
	char cod[8],titulo[100],midia[10],genero[50];
	float preco;
	
	int op;
	do{
		menu();
		fflush(stdin);
		scanf("%d",&op);
		switch(op){
			case 1:
				puts("Digite o nome do arquivo a ser carregado:");
				fflush(stdin);//Limpa o buffer de entrada
				gets(narq);
				arquivoE = fopen(narq,"r");
							
				if(arquivoE==NULL){
					puts("Arquivo inexistente");
					exit(1);
				}else
					printf("Arquivo aberto com sucesso\n");
				
				//Alocacao para o struct de dados
				data = (Dados *)malloc(sizeof(Dados));
				fgets(titulo,1000,arquivoE);//Pula o cabecalho
				fflush(stdin);
				
				while(!feof(arquivoE)){
					//Aloca um novo espaco de memoria para
					//cada novo dado
					data = (Dados *)malloc(sizeof(Dados));
					
					//Escaneia os dados do arquivo e
					//armazena nas variaveis
					fscanf(arquivoE,"%s",&cod);
					
					fscanf(arquivoE,"%s",&titulo);
						
					fscanf(arquivoE,"%s",&midia);
					
					fscanf(arquivoE,"%f",&preco);
					
					fscanf(arquivoE,"%s",&genero);
					
					//Copia os dados para o bloco
					//de dados
					strcpy(data->Titulo, titulo);
					
					strcpy(data->Midia, midia);
					data->Preco = preco;
					strcpy(data->Genero, genero);
					
					//Insere os dados na arvore
					Insert(cod,&root,data);
					
				}	
				
				fclose(arquivoE);
				break;
			case 2:
				root = Empty(root);
				puts("Arvore Esvaziada!");
				break;
			case 3:
				if(root!=NULL){
					ImpCresc(root);
				}else{
					puts("Arvore Vazia!");
				}
				break;
			case 4:
				if(root!=NULL)
					printf("Minimo: %s", FindMin(root)->data==NULL ? "Arvore vazia" : FindMin(root)->data);
				else
					puts("Arvore Vazia!");
				break;
			case 5:
				if(root!=NULL)
					printf("Maximo: %s", FindMax(root)->data==NULL ? "Arvore vazia" : FindMax(root)->data);
				else
					puts("Arvore Vazia!");
				break;
			case 6:
				
				arquivoS = fopen("VIDEOS_CODIGO.txt","w+");
				if(root!=NULL){
					Print(arquivoS,root);
					printf("\nArquivo gravado com sucesso");
				}else{
					puts("Arvore Vazia!");
				}
				
				fclose(arquivoS);
				break;
			case 7:
				system("cls");
				break;
			default:
				;
		}
	}while(op!=0);
		
	return 0;
}

