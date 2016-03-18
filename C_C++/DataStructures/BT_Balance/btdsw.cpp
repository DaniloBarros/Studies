void transform(BTree *tree, int qtd)
{
	BTNode *gr, *par, *ch;
	
	// Inicialmente todos nulos
	gr = par = ch = 0;
	
	// Transforma o n�mero de vezes
	// indicado no par�metro
	for (int i = 0; i < qtd; i++)
	{
		for (j = 0; j <= 1; j++)
		{
			// Atualiza o pai e o av�
			gr = par;
			par = ch;
			
			// Define o filho
			if (ch)
				ch = ch->right;
			else if (!par)
				ch = tree->root;
		}
		
		// Atualiza o root, quando
		// necess�rio
		if (par == tree->root)
			tree->root = ch;

		// Rotaciona � esquerda
		rotateLeft(gr, par, ch);
	}
}

void dsw(BTree *tree)
{
	// Verifica os par�metros
	if (!tree || !tree->root)
		return;
	
	// Cria o backbone
	backbone(tree);
	
	// Calcula o n�mero de transforma��es
	// necess�rias
	int n = size(tree->root);
	int m = pow(2, (int) log(n+1)/log(2)) - 1;
	
	// Realiza a transforma��o inicial
	transform(n - m);
	
	// Realiza as demais transforma��es
	while (m)
	{
		m = m/2;
		transform(m);
	}
}
