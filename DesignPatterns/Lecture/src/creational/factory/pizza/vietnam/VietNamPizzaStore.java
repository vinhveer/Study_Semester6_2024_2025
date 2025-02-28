package creational.factory.pizza.vietnam;

import creational.factory.pizza.Pizza;
import creational.factory.pizza.PizzaStore;
import creational.factory.pizza.PizzaType;

public class VietNamPizzaStore extends PizzaStore {
    @Override
    public Pizza createPizza(PizzaType type) {
        switch (type) {
            case HAISAN:
                return new PizzaHaiSan();
//            case BO:
//                return new PizzaBo();
//            case PHOMAI:
//                return new PizzaPhoMai();
            default:
                return null;
        }
    }
}
