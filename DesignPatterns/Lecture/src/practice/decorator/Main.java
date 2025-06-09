package practice.decorator;

public class Main {
    public static void main(String[] args) {
        IImageProcess image = new BasicProcess("ok.jpg");

        image = new BorderDecorator(
                    new WatermarkDecorator(
                            new FilterDecorator(image)
                    )
        );

        image.process();
    }
}
