package session_two.bai_tap_a3;

public class Main {
    public static void main(String[] args) {
        ShapeFactory factory = new ShapeFactory();

        Shape shape = factory.createShape(ShapeType.CIRCLE);
        System.out.println(shape.draw());
    }
}
