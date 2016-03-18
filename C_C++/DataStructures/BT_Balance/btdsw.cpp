void transform(BTree *tree, int qtd)
{
	BTNode *gr, *par, *ch;
	
	// Inicialmente todos nulos
	gr = par = ch = 0;
	
	// Transforma o número de vezes
	// indicado no parâmetro
	for (int i = 0; i < qtd; i++)
	{
		for (j = 0; j <= 1; j++)
		{
			// Atualiza o pai e o avô
			gr = par;
			par = ch;
			
			// Define o filho
			if (ch)
				ch = ch->right;
			else if (!par)
				ch = tree->root;
		}
		
		// Atualiza o root, quando
		// necessário
		if (par == tree->root)
			tree->root = ch;

		// Rotaciona à esquerda
		rotateLeft(gr, par, ch);
	}
}

void dsw(BTree *tree)
{
	// Verifica os parâmetros
	if (!tree || !tree->root)
		return;
	
	// Cria o backbone
	backbone(tree);
	
	// Calcula o número de transformações
	// necessárias
	int n = size(tree->root);
	int m = pow(2, (int) log(n+1)/log(2)) - 1;
	
	// Realiza a transformação inicial
	transform(n - m);
	
	// Realiza as demais transformações
	while (m)
	{
		m = m/2;
		transform(m);
	}
}
