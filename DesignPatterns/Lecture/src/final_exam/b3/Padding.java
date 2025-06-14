package final_exam.b3;

public class Padding extends LayoutDecorator {
    public Padding(Widget widget) {
        super(widget);
    }

    @Override
    public String build() {
        return "Padding(" + widget.build() + ")";
    }
}
