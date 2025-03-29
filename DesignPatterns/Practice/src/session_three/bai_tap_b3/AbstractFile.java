package session_three.bai_tap_b3;

public abstract class AbstractFile {
    protected String name;
    protected String path;

    String prefix = "";

    public AbstractFile(String name) {
        this.name = name;
        this.path = name;
    }

    public abstract String getStringTreeFolder();
    public abstract AbstractFile addItem(AbstractFile file);
    public abstract void removeItem(AbstractFile file);

    public String getPath() {
        return this.path;
    }
}
