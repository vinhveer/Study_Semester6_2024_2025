package behavioral.strategy.duck_example;

public class BayVong implements IFlyBehavior {
    @Override
    public String fly() {
        return "Quay đều ...";
    }
}
