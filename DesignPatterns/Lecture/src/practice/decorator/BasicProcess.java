package practice.decorator;

public class BasicProcess implements IImageProcess {
    private final String path;

    public BasicProcess(String path) {
        this.path = path;
    }

    @Override
    public void process() {
        System.out.println("Xử lý ảnh cơ bản " + path);
    }
}
