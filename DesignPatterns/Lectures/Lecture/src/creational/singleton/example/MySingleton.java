package creational.singleton.example;

public class MySingleton {
    // Declare Singleton instance
    private static MySingleton instance;
    private int count = 0;

    // Private constructor to prevent instantiation from other classes
    private MySingleton() {}

    // Static method to provide global access point
    public static MySingleton getInstance() {
        if (instance == null) {
            instance = new MySingleton();
        }
        return instance;
    }

    // Method to display and increment the count
    public void display() {
        System.out.println(++count);
    }
}
