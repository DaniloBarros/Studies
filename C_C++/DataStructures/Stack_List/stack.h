#ifndef PILHA_H
#define PILHA_H

#include <iostream>

using namespace std;

template<class T>
class Node {
public:
	Node(const T& info, Node *next = 0);
	
	T info;
	Node *next;
};

template<class T>
Node<T>::Node(const T& info, Node *next)
{
	this->info = info;
	this->next = next;
}

template<class T>
class Stack {
	
public:
	Stack();
	
	~Stack();
	
	void clear();
	bool empty();
	void print();
	void push(const T& info);
	void pop();
	T& top() const;

protected:
	Node<T> *head;
};

template<class T>
Stack<T>::Stack()
{
	head = 0;
}

template<class T>
Stack<T>::~Stack()
{
	clear();
}

template<class T> void 
Stack<T>::clear()
{
	Node<T> *temp;
	
	while (head)
	{
		temp = head;
		
		head = temp->next;
		
		delete temp;
	}
	
	head = 0;
}

template<class T> bool 
Stack<T>::empty()
{
	return head == 0;
}

template<class T> void 
Stack<T>::push(const T& info)
{
	Node<T> *node = new Node<T>(info, head);
	
	if (!node)
		return;
	
	head = node;
}

template<class T> void 
Stack<T>::pop()
{
	Node<T> *temp;
	
	if (!head)
		return;
	
	temp = head;
	head = temp->next;

	delete temp;
}

template<class T> T& 
Stack<T>::top() const
{
	return head->info;
}

template<class T> void 
Stack<T>::print()
{
	Node<T> *next;
	
	for (next = head; next; next = next->next)
		cout << "[" << next->info << "]";
}

#endif

