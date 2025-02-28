package behavioral.strategy.duck_example;

public class SQuack implements IQuackBehavior {
    @Override
    public String quack() {
        return "Quack, quack ...";
    }
}
