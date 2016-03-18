int max(int a, int b)
{
	return a > b ? a : b;
}

int heigth(BTNode *node)
{
	if (!node)
		return 0;
	
	return max(heigth(node->left), 
		heigth(node->right)) + 1;
}

bool isBalanced(BTNode *node)
{
	if (!node)
		return true;
	
	int left = heigth(node->left);
	int right = heigth(node->right);
	
	if (abs(left - right) > 1)
		return false;
	
	return isBalanced(node->left) 
		&& isBalanced(node->right);
}