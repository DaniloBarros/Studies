#include <floatnode.h>

// Implementação do método construtor
FloatNode::FloatNode(float info, FloatNode *next)
{
	// Guarda os valores dos parâmetros nos 
	// atributos da classe
	this->info = info;
	this->next = next;
}
