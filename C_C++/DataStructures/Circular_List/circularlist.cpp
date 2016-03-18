#include <CircularList.h>

ostream& 
operator<<(ostream& os, const CircularList& list)
{
	if (!list.tail)
		return os;
	
	FloatNode *next = list.tail;
	
	do {
		next = next->next;
		os << "[" << next->info << "]";
	} while (next != list.tail);
	
	return os;
}
	
CircularList::CircularList()
{
	tail = 0;
}

void 
CircularList::push_front(float info)
{
	FloatNode *node = new FloatNode(info);
	
	if (!node)
		return;
	
	if (tail)
	{
		node->next = tail->next;
	} else {
		tail = node;
	}
	
	tail->next = node;
}

