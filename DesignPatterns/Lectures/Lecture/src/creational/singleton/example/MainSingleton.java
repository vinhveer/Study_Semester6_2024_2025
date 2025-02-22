package creational.singleton.example;

public class MainSingleton {
    public static void main(String[] args) {
        MySingleton singleton = MySingleton.getInstance();
        MySingleton singleton1 = MySingleton.getInstance();

        singleton.display();
        singleton1.display();
        singleton.display();
        singleton1.display();
    }
}
