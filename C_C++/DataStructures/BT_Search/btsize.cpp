int size(BTNode *node)
{
	if (!node)
		return 0;
	
	return size(node->left) 
		+ size(node->right) + 1;
}
