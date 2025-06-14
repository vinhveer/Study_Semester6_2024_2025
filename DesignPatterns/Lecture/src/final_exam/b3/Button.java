package final_exam.b3;

public class Button implements Widget {
    private final String label;

    public Button(String label) {
        this.label = label;
    }

    @Override
    public String build() {
        return "Button(" + label + ")";
    }
}
