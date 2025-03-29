package session_three.bai_tap_b3;

public class Main {
    public static void main(String[] args) {
        AbstractFile root = new Folder("D:");

        AbstractFile taiLieu = new Folder("Tailieu");
        AbstractFile lapTrinh = new Folder("LapTrinh");
        AbstractFile designPattern = new Folder("DesignPattern");
        AbstractFile creational = new Folder("CreationalPattern.pptx");
        AbstractFile structural = new Folder("StructuralPattern.pptx");
        AbstractFile lapTrinhC = new Folder("lapTrinhC.pptx");
        AbstractFile lapTrinhJava = new Folder("lapTrinhJava.pptx");
        AbstractFile ny = new Folder("ny.pptx");

        root.addItem(taiLieu).addItem(ny);
        taiLieu.addItem(lapTrinh).addItem(designPattern);

        lapTrinh.addItem(lapTrinhC).addItem(lapTrinhJava);
        designPattern.addItem(creational).addItem(structural);

        System.out.println(root.getStringTreeFolder());
        System.out.println(lapTrinhC.getPath());
        System.out.println(lapTrinh.getPath());
    }
}
