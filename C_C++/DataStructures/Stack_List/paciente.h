#ifndef PACIENTE_H
#define PACIENTE_H

#include <iostream>
#include <string>

using namespace std;

class Paciente {
public:
	Paciente(const string& nome, int idade = 18)
	{
		setNome(nome);
		setIdade(idade);
	}
	
	string getNome() const
	{
		return nome;
	}
	
	int getIdade() const
	{
		return idade;
	}
	
	void setNome(const string& nome)
	{
		this->nome = nome;
	}
	
	void setIdade(int idade)
	{
		if (idade > 0 && idade < 150)
			this->idade = idade;
		else
			idade = 0;
	}
	
	bool operator<(const Paciente& p) const
	{
		return idade > p.getIdade();
	}
	
private:
	string nome;
	int idade;
};

#endif
