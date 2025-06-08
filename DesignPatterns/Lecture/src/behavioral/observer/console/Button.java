package behavioral.observer.console;

public class Button {
    IClickListener clickListener;

    // Attach
    public void addListener(IClickListener clickListener) {
        this.clickListener = clickListener;
    }

    // Notify
    public void addEvent() {
        clickListener.listen();
    }
}
