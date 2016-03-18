#ifndef CIRCULAR_LIST_H
#define CIRCULAR_LIST_H

#include <ostream>
#include <floatnode.h>

using namespace std;

// Classe que representa uma lista circular
class CircularList {
	// Método amigo: pode acessar os campos
	// privados da classe
	friend ostream& operator<<(ostream& os,
		const CircularList& list);
	
public:
	// Método construtor
	CircularList();
	
	// Adiciona um elemento no início da lista
	void push_front(float info);
	
	// Adiciona um elemento no final da lista
	void push_back(float info);
	
private:
	// Atributo privado: ponteiro para o
	// último elemento da lista
	FloatNode *tail;
};

#endif