package behavioral.strategy.duck_example;

public class VitQuayQuack implements IQuackBehavior {
    @Override
    public String quack() {
        return "1, 2, 3 zoooooo ...";
    }
}
