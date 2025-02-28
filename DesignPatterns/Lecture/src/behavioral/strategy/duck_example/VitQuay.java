package behavioral.strategy.duck_example;

public class VitQuay extends Duck {
    public VitQuay(IFlyBehavior flyBehavior, IQuackBehavior quackBehavior) {
        super(flyBehavior, quackBehavior);
    }

    @Override
    public void display() {
        System.out.println("VitQuay is display ...");
        swim();
        performFly();
        performQuack();
        System.out.println("Chúc ngon!");
    }
}
