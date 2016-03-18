#ifndef FLOAT_NODE_H
#define FLOAT_NODE_H

// Classe que define um n� cujas informa��es
// s�o n�meros em ponto flutuante
class FloatNode {
public:
	// M�todo construtor da classe
	FloatNode(float info, FloatNode *next = 0);
	
	// Campo p�blico que guarda a informa��o
	float info;
	
	// Ponteiro para o pr�ximo n�
	FloatNode *next;
};

#endif