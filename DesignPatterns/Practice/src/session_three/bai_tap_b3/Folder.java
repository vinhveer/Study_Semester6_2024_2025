package session_three.bai_tap_b3;

import java.util.ArrayList;
import java.util.List;

public class Folder extends AbstractFile {
    List<AbstractFile> files = new ArrayList<>();

    public Folder(String name) {
        super(name);
    }

    @Override
    public String getStringTreeFolder() {
        StringBuilder builder = new StringBuilder();

        builder.append(this.prefix)
                .append(this.name);

        for (AbstractFile file : files) {
            file.prefix = this.prefix + "|-";
            builder.append("\n")
                    .append(file.getStringTreeFolder());

            file.prefix = "";
        }

        return builder.toString();
    }

    @Override
    public AbstractFile addItem(AbstractFile file) {
        for (var fileItem : files) {
            if (fileItem.name.equals(file.name)) {
                return this;
            }
        }

        files.add(file);
        file.path = this.getPath() + "/" + file.path;
        return this;
    }

    @Override
    public void removeItem(AbstractFile file) {
        files.remove(file);
    }
}
