bool search(BTNode *node, int info)
{
	if (!node)
		return false;
	
	if (node->info == info)
		return true;
	
	return search(node->left, info) 
		|| search(node->right, info);
}
