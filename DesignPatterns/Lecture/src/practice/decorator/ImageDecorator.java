package practice.decorator;

public abstract class ImageDecorator implements IImageProcess {
    IImageProcess imageProcess;

    public ImageDecorator(IImageProcess imageProcess) {
        this.imageProcess = imageProcess;
    }

    @Override
    public abstract void process();
}
