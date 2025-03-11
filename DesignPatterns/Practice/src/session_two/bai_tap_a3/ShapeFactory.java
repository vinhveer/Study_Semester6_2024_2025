package session_two.bai_tap_a3;

public class ShapeFactory {
    public Shape createShape(ShapeType shapeType) {
        return switch (shapeType) {
            case CIRCLE -> Circle.getInstance();
            case TRIANGLE -> Triangle.getInstance();
            case RECTANGLE -> Rectangle.getInstance();
            default -> Rectangle.getInstance();
        };
    }
}
