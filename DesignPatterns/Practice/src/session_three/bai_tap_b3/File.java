package session_three.bai_tap_b3;

public class File extends AbstractFile {
    public File(String name) {
        super(name);
    }

    @Override
    public String getStringTreeFolder() {
        return this.prefix + this.name;
    }

    @Override
    public AbstractFile addItem(AbstractFile file) {
        return null;
    }

    @Override
    public void removeItem(AbstractFile file) {}
}
