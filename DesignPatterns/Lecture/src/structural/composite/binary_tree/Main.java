package structural.composite.binary_tree;

public class Main {
    public static void main(String[] args) {
        Node root = new InternalNode(10);
        Node node1 = new InternalNode(20);
        Node node2 = new InternalNode(30);
        Node node3 = new InternalNode(40);

        Node leaf1 = new LeafNode(50);
        Node leaf2 = new LeafNode(60);
        Node leaf3 = new LeafNode(70);
        Node leaf4 = new LeafNode(80);

        root.addLeftNode(node1);
        root.addRightNode(node2);

        node1.addLeftNode(node3);

        node2.addLeftNode(leaf1);
        node2.addRightNode(leaf2);

        node3.addLeftNode(leaf3);
        node3.addRightNode(leaf4);


        root.browseNode();
        System.out.println();
        node1.browseNode();
        System.out.println();
        node2.browseNode();
        System.out.println();
        node3.browseNode();
    }
}
