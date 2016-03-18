void breadth_first(BTree *tree)
{
	queue<BTNode *> queue;
    BTNode *node = tree->root;
	
	if (!node)
		return;
	
	queue.enqueue(node);
	
	while (!queue.empty()) 
	{
		node = queue.dequeue();
		visit(node);
		if (node->left)
			queue.enqueue(node->left);
		if (node->right)
			queue.enqueue(node->right);
	}
}
