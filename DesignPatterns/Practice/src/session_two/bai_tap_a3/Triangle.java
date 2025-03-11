package session_two.bai_tap_a3;

public class Triangle extends Shape {
    private static Triangle instance;

    private Triangle() {}

    public static Triangle getInstance() {
        if (instance == null) {
            instance = new Triangle();
        }
        return instance;
    }

    @Override
    public String draw() {
        return "Draw Triangle";
    }
}
