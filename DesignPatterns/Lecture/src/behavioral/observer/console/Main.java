package behavioral.observer.console;

public class Main {
    public static void main(String[] args) {
        Button button = new Button();
        IClickListener activity = new Activity(button);

        button.addListener(activity);

        button.addEvent();
        button.addEvent();
        button.addEvent();
    }
}
