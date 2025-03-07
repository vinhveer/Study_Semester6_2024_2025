package structural.decorator.beverage;

public class MainBeverage {
    public static void main(String[] args) {
        Beverage beverage = new Espresso("Cà phê sữa");
        beverage = new Milk("Sữa", beverage);
        System.out.println(beverage.getDescription() + " giá " + beverage.cost());

        beverage = new Espresso("Cà phê đen");
        beverage = new Milk("Sữa ông thọ", beverage);
        System.out.println(beverage.getDescription() + " giá " + beverage.cost());

        beverage = new Espresso("Cà phê ---");
        beverage = new Mocha("----", beverage);
        System.out.println(beverage.getDescription() + " giá " + beverage.cost());
    }
}
