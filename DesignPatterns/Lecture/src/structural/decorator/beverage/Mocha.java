package structural.decorator.beverage;

public class Mocha extends CondimentDecorator {
    public Mocha(String description, Beverage beverage) {
        super(description, beverage);
    }

    @Override
    public int cost() {
        return beverage.cost() + 10000;
    }

    @Override
    public String getDescription() {
        return super.getDescription();
    }
}
