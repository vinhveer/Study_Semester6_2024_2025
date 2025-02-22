package creational.builder.computer;

public class MainComputer {
    public static void main(String[] args) {
        Computer computer = new Computer.Builder()
                .buildCPU("Intel Xeon")
                .buildRAM("64G 7200")
                .buildStorage("5TB SSD NVMe")
                .buildScreen("24 inches 8K")
                .build();

        System.out.println(computer.toString());
    }
}