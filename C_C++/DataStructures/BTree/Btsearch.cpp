BTreeNode * BTreeSearch(T K, BTreeNode *node)
{
	if (!node)
		return 0;
	
	for (int i = 1; i <= node->keyTally 
		&& node->keys[i - 1] < K; i++);
	
	if (i > node->keyTally)
		return BTreeSearch(K, node->pointers[i]);
	else if (node->keys[i - 1] > K)
		return BTreeSearch(K, node->pointers[i-1]);
	else 
		return node;
}