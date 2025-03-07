package structural.composite.binary_tree;

public class InternalNode extends Node {
    private Node leftNode;
    private Node rightNode;

    public InternalNode(int value) {
        super(value);
        this.leftNode = null;
        this.rightNode = null;
    }

    @Override
    public void addLeftNode(Node node) {
        this.leftNode = node;
    }

    @Override
    public void addRightNode(Node node) {
        this.rightNode = node;
    }

    @Override
    public void removeLeftNode() {
        this.leftNode = null;
    }

    @Override
    public void removeRightNode() {
        this.rightNode = null;
    }

    @Override
    public void browseNode() {
        if (leftNode != null) {
            leftNode.browseNode();
        }

        System.out.print("  " + value);

        if (rightNode != null) {
            rightNode.browseNode();
        }
    }
}