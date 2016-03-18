void preorder(BTNode *node)
{
	if (node)
	{
		visit(node);
		preorder(node->left);
		preorder(node->right);
	}
}

void inorder(BTNode *node)
{
	if (node)
	{
		inorder(node->left);
		visit(node);
		inorder(node->right);
	}
}

void postorder(BTNode *node)
{
	if (node)
	{
		postorder(node->left);
		postorder(node->right);
		visit(node);
	}
}