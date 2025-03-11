package session_two.bai_tap_a7;

public class Main {
    public static void main(String[] args) {
        Computer computer = new Computer.Builder()
                .buildCPU("Intel Core Ultra")
                .buildRAM("32GB")
                .buildStorage("1TB")
                .buildScreen("4K")
                .build();

        System.out.println(computer.toString());
    }
}
