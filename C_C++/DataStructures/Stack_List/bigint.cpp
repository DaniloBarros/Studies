#include <iostream>
#include <stack>

using namespace std;

string soma(const string& a, const string& b)
{
	stack<char> x, y, z;
	
	for (unsigned int i = 0; i < a.size(); i++)
		x.push(a[i]);
	
	for (unsigned int i = 0; i < b.size(); i++)
		y.push(b[i]);
	
	int carry = 0, res;
	int max = a.size() > b.size() ? a.size() : b.size();
	
	for (int i = 0; i < max; i++)
	{
		res = carry;
		
		if (!x.empty()) 
		{
			res += (x.top() - '0');
			x.pop();
		}
		
		if (!y.empty())
		{
			res += (y.top() - '0');
			y.pop();
		}

		z.push((res % 10) + '0');
		
		carry = res / 10;
	}
	
	if (carry)
		z.push(carry + '0');
	
	string c = "";
	
	while (!z.empty())
	{
		c = c + z.top();
		
		z.pop();
	}
	
	return c;
}

int main()
{
	string a, b, c;
	
	cout << "Insira o primeiro numero: ";
	cin >> a;
	
	cout << "Insira o segundo numero: ";
	cin >> b;
	
	c = soma(a, b);
	
	cout << "Soma: " << c << endl;
	
	return 0;
}
