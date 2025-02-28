package creational.builder.computer;

public class Computer {
    String cpu, ram, storage, screen;

    private Computer(Builder builder) {
        this.cpu = builder.cpu;
        this.ram = builder.ram;
        this.storage = builder.storage;
        this.screen = builder.screen;
    }

    @Override
    public String toString() {
        return "Computer{" +
                "cpu='" + cpu + '\'' +
                ", ram='" + ram + '\'' +
                ", storage='" + storage + '\'' +
                ", screen='" + screen + '\'' +
                '}';
    }

    public static class Builder {
        String cpu, ram, storage, screen;

        public Builder buildCPU(String cpu) {
            this.cpu = cpu;
            return this;
        }

        public Builder buildRAM(String ram) {
            this.ram = ram;
            return this;
        }

        public Builder buildStorage(String storage) {
            this.storage = storage;
            return this;
        }

        public Builder buildScreen(String screen) {
            this.screen = screen;
            return this;
        }

        public Computer build() {
            return new Computer(this);
        }
    }
}
