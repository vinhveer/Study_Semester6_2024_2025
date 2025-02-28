package behavioral.strategy.duck_example;

public class MainDuck {
    public static void main(String[] args) {
        Duck duck = new VitQuay(new BayVong(), new SQuack());
        duck.display();
        duck.setQuackBehavior(new VitQuayQuack());
        duck.display();
    }
}
