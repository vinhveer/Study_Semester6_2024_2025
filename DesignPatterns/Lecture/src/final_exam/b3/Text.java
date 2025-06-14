package final_exam.b3;

public class Text implements Widget {
    public String text;

    public Text(String text) {
        this.text = text;
    }

    @Override
    public String build() {
        return "Text(" + text + ")";
    }
}
