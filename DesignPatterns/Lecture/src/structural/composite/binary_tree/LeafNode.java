package structural.composite.binary_tree;

public class LeafNode extends Node {
    public LeafNode(int value) {
        super(value);
    }

    @Override
    public void addLeftNode(Node node) {

    }

    @Override
    public void addRightNode(Node node) {

    }

    @Override
    public void removeLeftNode() {

    }

    @Override
    public void removeRightNode() {

    }

    @Override
    public void browseNode() {
        System.out.print("  " + value);
    }
}
