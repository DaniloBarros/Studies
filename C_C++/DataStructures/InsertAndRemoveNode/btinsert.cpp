void insert(BTree *tree, int info)
{
	BTNode *node, *prev;
	
	if (!tree)
		return;
	
	node = tree->root;
	
	while (node)
	{
		prev = node;
		
		if (node->info == info)
			return;
		else if (info < node->info)
			node = node->left;
		else
			node = node->right;
	}
	
	if (!tree->root)
		tree->root = new BTNode(info);
	else if (info < prev->info)
		prev->left = new BTNode(info);
	else 
		prev->right = new BTNode(info);
}