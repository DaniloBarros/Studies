#include <stack.h>
#include <string>

using namespace std;

int main()
{
	Stack<string> stack;
	
	cout << "Pilha vazia? " << (stack.empty() ?  "sim" : "nao") << endl;
	
	stack.push("teste");
	stack.push("outra");
	stack.push("ultima");
	
	cout << "Pilha: ";
	stack.print();
	cout << endl;
	
	cout << "Elemento no topo: " << stack.top() << endl;
	
	stack.pop();
	cout << "Elemento removido!" << endl;
	
	cout << "Elemento no topo: " << stack.top() << endl;
	
	stack.clear();
	cout << "Pilha vazia? " << (stack.empty() ?  "sim" : "nao") << endl;
	
	return 0;
}

