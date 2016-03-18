#include <queue>
#include <paciente.h>

using namespace std;

int main()
{
	string nome;
	int idade;
	
	priority_queue<Paciente> queue;
	
	for (int i = 0; i < 5; i++)
	{
		cout << "Insira o nome do paciente: ";
		cin >> nome;
		
		cout << "Insira a idade do paciente: ";
		cin >> idade;
		
		queue.push(Paciente(nome, idade));
	}
	
	Paciente paciente("Paciente");
	
	for (int i = 0; i < 5; i++)
	{
		paciente = queue.top();
		
		cout << "Proximo paciente a ser atendido: ";
		cout << paciente.getNome() << "(" << paciente.getIdade() 
			<< " anos)" << endl;
		
		queue.pop();
	}
	
	return 0;
}

