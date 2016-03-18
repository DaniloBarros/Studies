#ifndef CIRCULAR_LIST_H
#define CIRCULAR_LIST_H

#include <ostream>
#include <floatnode.h>

using namespace std;

class CircularList {
	friend ostream& operator<<(ostream& os, const CircularList& list);
	
public:
	CircularList();
	
	void push_front(float info);
	
private:
	FloatNode *tail;
};

#endif
