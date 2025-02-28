package creational.factory.pizza;

public abstract class PizzaStore {
    public abstract Pizza createPizza(PizzaType type);

    public Pizza orderPizza(PizzaType type) {
        Pizza pizza = createPizza(type);
        pizza.prepare();
        pizza.bake();
        pizza.cut();
        pizza.box();
        return pizza;
    }
}
