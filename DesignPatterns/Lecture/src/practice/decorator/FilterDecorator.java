package practice.decorator;

public class FilterDecorator extends ImageDecorator {
    public FilterDecorator(IImageProcess imageProcess) {
        super(imageProcess);
    }

    @Override
    public void process() {
        imageProcess.process();
        System.out.println("Thêm lớp phủ");
    }
}
