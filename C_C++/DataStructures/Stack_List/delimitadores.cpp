#include <iostream>
#include <stack>

using namespace std;

#define START_OF_TEXT	0x02
#define END_OF_TEXT		0x03

static unsigned int index = 0;

char proximoSimbolo(const string& expressao)
{
	char simbolo = (index < expressao.size()) ? expressao[index] : END_OF_TEXT;
	index++;
	return simbolo;
}

char simboloAnterior(const string& expressao)
{
	char simbolo; 
	
	if (index > 0) 
	{
		index--;
		simbolo = expressao[index];
	} else
	{
		simbolo = START_OF_TEXT;
	}

	return simbolo;
}

void devolveUltimoSimboloLidoParaExpressao()
{
	index--;
}

bool verificaDelimitadores(const string& expressao)
{
	stack<char> pilha;
	char simbolo, proximo, anterior;
	
	while ((simbolo = proximoSimbolo(expressao)) != END_OF_TEXT)
	{
		switch (simbolo) 
		{
			case '(':
			case '[':
			case '{':
				pilha.push(simbolo);
			break;
			
			case '/':
				proximo = proximoSimbolo(expressao);

				if (proximo == '*')
				{
					pilha.push(simbolo);
				} else
				{
					devolveUltimoSimboloLidoParaExpressao();
				}
			break;
			
			case ')':
				if (pilha.empty() || pilha.top() != '(')
					return false;
				else
					pilha.pop();
				break;
				
			case ']':
				if (pilha.empty() || pilha.top() != '[')
					return false;
				else
					pilha.pop();
				break;
				
			case '}':
				if (pilha.empty() || pilha.top() != '{')
					return false;
				else
					pilha.pop();
			break;
			
			case '*':
				simbolo = simboloAnterior(expressao);
				anterior = simboloAnterior(expressao);

				if (anterior == '/')
				{
					if (pilha.empty() || pilha.top() != '/')
						return false;
					else
						pilha.pop();
				} 

				simbolo = proximoSimbolo(expressao);
			break;
		}
	}
	
	return pilha.empty();
}

static const int TAMANHO_MAXIMO_DA_EXPRESSAO = 4096;

int main()
{
	char expressao[TAMANHO_MAXIMO_DA_EXPRESSAO];
	
	cout << "Insira a expressao a ser analizada: ";
	cin.getline(expressao, TAMANHO_MAXIMO_DA_EXPRESSAO);
	
	bool ok = verificaDelimitadores(expressao);
	
	if (ok)
		cout << "Expressao correta" << endl;
	else
		cout << "Expressao invalida" << endl;
	
	return 0;
}
