#ifndef B_TREE_NODE_H
#define B_TREE_NODE_H

template<class T, int M>
class BTreeNode {
public:
	BTreeNode();
	
private:
	bool leaf;
	int keyTally;
	T keys[M-1];
	BTreeNode *pointers[M];
};

#endif
