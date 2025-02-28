package creational.factory.pizza.vietnam;

import creational.factory.pizza.Pizza;

public class PizzaHaiSan extends Pizza {
    @Override
    public void prepare() {
        this.getBuilder().append("Preparing Pizza Hai San\n");
    }

    @Override
    public void bake() {
        this.getBuilder().append("Baking Pizza Hai San\n");
    }

    @Override
    public void cut() {
        this.getBuilder().append("Cutting Pizza Hai San\n");
    }

    @Override
    public void box() {
        this.getBuilder().append("Boxing Pizza Hai San\n");
    }
}
