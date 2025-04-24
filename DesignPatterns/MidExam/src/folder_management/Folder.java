package folder_management;

import java.util.ArrayList;
import java.util.List;

public class Folder extends AbstractFile {
    private final List<AbstractFile> items = new ArrayList<>();

    public Folder(String name) {
        super(name);
    }

    @Override
    public String getStringTreeFolder() {
        StringBuilder folderTree = new StringBuilder();
        folderTree.append(this.prefix).append(this.name);

        for (AbstractFile file : items) {
            // Save original prefix
            String originalPrefix = file.prefix;
            // Set new prefix for nested display
            file.prefix = this.prefix + "  ";

            folderTree.append("\n");
            folderTree.append(file.getStringTreeFolder());

            // Restore original prefix
            file.prefix = originalPrefix;
        }

        return folderTree.toString();
    }

    @Override
    public String getPath() {
        return this.path;
    }

    @Override
    public void addItem(AbstractFile file) {
        // Update the path of the file to include the folder's path
        file.path = this.path + "/" + file.name;
        items.add(file);
    }

    @Override
    public void removeItem(AbstractFile file) {
        items.remove(file);
    }
}