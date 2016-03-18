bool search(BTree *tree, int info)
{
	if (!tree)
		return false;
	
	BTNode *node = tree->root;
	
	while (node)
	{
		if (info == node->info)
			return true;
		else if (info < node->info)
			node = node->left;
		else 
			node = node->right;
	}
	
	return false;
}
