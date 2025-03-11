package session_two.bai_tap_a3;

public class Rectangle extends Shape {
    private static Rectangle instance;

    public Rectangle() {}

    public static Rectangle getInstance() {
        if (instance == null) {
            instance = new Rectangle();
        }
        return instance;
    }

    @Override
    public String draw() {
        return "Draw Rectangle";
    }
}
