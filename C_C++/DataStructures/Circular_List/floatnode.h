#ifndef FLOAT_NODE_H
#define FLOAT_NODE_H

// Classe que define um nó cujas informações
// são números em ponto flutuante
class FloatNode {
public:
	// Método construtor da classe
	FloatNode(float info, FloatNode *next = 0);
	
	// Campo público que guarda a informação
	float info;
	
	// Ponteiro para o próximo nó
	FloatNode *next;
};

#endif