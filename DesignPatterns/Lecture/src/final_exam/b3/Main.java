package final_exam.b3;

public class Main {
    public static void main(String[] args) {
        Widget button = new Button("Click Me");
        button = new Padding(button);

        System.out.println(button.build());
    }
}
