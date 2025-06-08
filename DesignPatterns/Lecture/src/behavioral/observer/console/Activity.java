package behavioral.observer.console;

public class Activity implements IClickListener {
    Button button;
    int count;

    public Activity(Button button) {
        this.button = button;
        button.addListener(this);
    }

    @Override
    public void listen() {
        count++;
        System.out.println("Button is Click " + count);
    }
}
