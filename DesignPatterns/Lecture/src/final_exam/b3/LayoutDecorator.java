package final_exam.b3;

public abstract class LayoutDecorator implements Widget {
    Widget widget;

    public LayoutDecorator(Widget widget) {
        this.widget = widget;
    }

    @Override
    public abstract String build();
}
