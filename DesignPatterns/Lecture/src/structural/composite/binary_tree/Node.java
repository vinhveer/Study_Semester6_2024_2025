package structural.composite.binary_tree;

public abstract class Node {
    int value;

    public Node(int value) {
        this.value = value;
    }

    public abstract void addLeftNode(Node node);
    public abstract void addRightNode(Node node);
    public abstract void removeLeftNode();
    public abstract void removeRightNode();

    public abstract void browseNode();
}
