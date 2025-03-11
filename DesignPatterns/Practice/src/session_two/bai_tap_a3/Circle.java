package session_two.bai_tap_a3;

public class Circle extends Shape {
    private static Circle instance;

    private Circle() {}

    public static Circle getInstance() {
        if (instance == null) {
            instance = new Circle();
        }
        return instance;
    }

    @Override
    public String draw() {
        return "Draw Circle";
    }
}