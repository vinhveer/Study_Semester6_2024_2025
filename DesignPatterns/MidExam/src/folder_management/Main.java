package folder_management;

public class Main {
    public static void main(String[] args) {
        Folder trilocak = new Folder("tri_lo_cak");

        trilocak.addItem(new File("hello.cpp"));
        trilocak.addItem(new File("cc.cpp"));

        Folder trilocak2 = new Folder("tri_lo_cak_2");
        trilocak2.addItem(new File("hello.java"));
        File cc = new File("cc.java");
        trilocak2.addItem(cc);

        trilocak.addItem(trilocak2);

        System.out.println(trilocak.getStringTreeFolder());
        System.out.println(cc.getPath());
    }
}
