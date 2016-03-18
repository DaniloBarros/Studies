//
//  main.c
//  Aula05IMC
//
//  Created by Danilo Barros Mendes on 2/12/15.
//  Copyright (c) 2015 Danilo Barros Mendes. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

#define IOF_DINHEIRO 1.0638
#define IOF_CARTAO 1.0038
#define DOLLAR 2.8619


//struct Pessoa{
//    float altura;
//    float massa;
//};

typedef struct {
    float massa;
    float altura;
}Pessoa;

typedef struct {
    
    float preco;
    int declarou;
    int tipo;
    
}Produto;

float massaCorporal(Pessoa *p){
    float imc;
    
    imc = p->massa/(p->altura*p->altura);
    
    return imc;
}

float RSToDollar(Produto p){
    return p.preco*DOLLAR;
}

float RSToDollarTxs(Produto p){
    
    return p.tipo ? p.preco*DOLLAR*IOF_CARTAO : p.preco*DOLLAR*IOF_DINHEIRO;
}

float alfandega(Produto p){
    if (p.preco>500) {
        return p.declarou ? RSToDollarTxs(p) * 1.5 : RSToDollarTxs(p) * 2;
    }else
        return p.preco;
    
}

int main(int argc, const char * argv[]) {
    
    Pessoa _pessoa1;
    _pessoa1.massa = 96.0;
    _pessoa1.altura = 1.7;
    
    Pessoa _pessoa2;
    _pessoa2.massa = 84.0;
    _pessoa2.altura = 1.97;
    
    printf("A pessoa1 tem %.2f de altura\n", _pessoa1.altura);
    printf("A pessoa1 tem %.2f de peso em kg\n", _pessoa1.massa);
    printf("Imc da pessoa1 %.2f\n", massaCorporal(&_pessoa1));
    
    printf("A pessoa2 tem %.2f de altura\n", _pessoa2.altura);
    printf("A pessoa2 tem %.2f de peso em kg\n", _pessoa2.massa);
    printf("Imc da pessoa2 %.2f\n\n\n", massaCorporal(&_pessoa2));
    
    //------------------------------------------------------------
    
    Produto produto;
    
    puts("Insira o preco do produto em dolar");
    scanf("%f", &produto.preco);
    
    puts("Insira o tipo de pagamento (0 Dinheiro, 1 Cartao)");
    scanf("%d", &produto.tipo);
    
    puts("Insira se declarou ou nao o produto (0 Nao Declarou, 1 Declarou)");
    scanf("%d", &produto.declarou);
    
    printf("Produto em dolar %.2f\nProduto em real %.2f\nProduto em real com taxas %.2f\nProduto apos alfandega %.2f", produto.preco, RSToDollar(produto), RSToDollarTxs(produto), alfandega(produto));
    
    //------------------------------------------------------------
    
    Pessoa *pessoa = (Pessoa *)malloc(sizeof(Pessoa));
    
    pessoa->altura = 1.75;
    pessoa->massa = 70;
    
    printf("\nMassa Corporal do Mauricio %.2f\n", massaCorporal(pessoa));
    
    free(pessoa);
    pessoa=NULL;
    
    return 0;
}
