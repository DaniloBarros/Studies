#ifndef FLOAT_LIST_H
#define FLOAT_LIST_H

#include <ostream>
#include <floatnode.h>

using namespace std;

class FloatList {
	
	friend ostream& operator<<(ostream& os, const FloatList *list); 
	
public:
	FloatList();
	
	FloatNode * first() const;
	FloatNode * last() const;
	
	int push_back(float info);
	int pop_back();
	
private:
	FloatNode *head;
	FloatNode *tail;
}; 

#endif
