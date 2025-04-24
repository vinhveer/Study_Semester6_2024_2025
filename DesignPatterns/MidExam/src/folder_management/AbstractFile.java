package folder_management;

public abstract class AbstractFile {
    String name;
    String path;

    String prefix = "";

    public AbstractFile(String name) {
        this.name = name;
        this.path = this.name;
    }

    public abstract String getStringTreeFolder();
    public abstract String getPath();
    public abstract void addItem(AbstractFile file);
    public abstract void removeItem(AbstractFile file);
}
