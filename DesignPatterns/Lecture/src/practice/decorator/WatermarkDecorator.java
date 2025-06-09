package practice.decorator;

public class WatermarkDecorator extends ImageDecorator {
    public WatermarkDecorator(IImageProcess imageProcess) {
        super(imageProcess);
    }

    @Override
    public void process() {
        imageProcess.process();
        System.out.println("Thêm hình chìm");
    }
}
