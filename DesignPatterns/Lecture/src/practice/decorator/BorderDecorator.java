package practice.decorator;

public class BorderDecorator extends ImageDecorator {
    public BorderDecorator(IImageProcess imageProcess) {
        super(imageProcess);
    }

    @Override
    public void process() {
        imageProcess.process();
        System.out.println("Tô viền cho ảnh");
    }
}
