#include <floatlist.h>

ostream& 
operator<<(ostream& os, const FloatList *list)
{
	FloatNode *next;
	
	if (!list)
		return os;
	
	for (next = list->head; next; next = next->next)
		os << "[" << next->info << "]";
	
	return os;
}

FloatList::FloatList()
{
	head = tail = 0;
}
	
FloatNode * 
FloatList::first() const
{
	return head;
}

FloatNode * 
FloatList::last() const
{
	return tail;
}
	
int 
FloatList::push_back(float info)
{
	FloatNode *node = new FloatNode(info, tail);
	
	if (!node)
		return -1;
	
	if (!head)
	{
		head = node;
	} else
	{
		tail->next = node;
	}
	
	tail = node;
	
	return 0;
}

int 
FloatList::pop_back()
{
	FloatNode *temp = tail;
	
	if (tail)
		tail = tail->prev;
	else
		return -1;
		
	if (!tail)
		head = 0;
	else
		tail->next = 0;

	delete temp;
	
	return 0;
}

