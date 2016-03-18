#include <CircularList.h>

#include <iostream>

using namespace std;

int main()
{
	CircularList list;
	float info;
	
	do {
		cout << "Insira um valor a ser inserido no inicio da lista "
			<< "insira negativo para sair): ";
		cin >> info;
		
		if (info < 0)
			break;
		
		list.push_front(info);
		
		cout << list << endl;
	} while (true);
	
	return 0;
}

