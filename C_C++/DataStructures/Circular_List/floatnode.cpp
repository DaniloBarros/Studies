#include <floatnode.h>

// Implementa��o do m�todo construtor
FloatNode::FloatNode(float info, FloatNode *next)
{
	// Guarda os valores dos par�metros nos 
	// atributos da classe
	this->info = info;
	this->next = next;
}
