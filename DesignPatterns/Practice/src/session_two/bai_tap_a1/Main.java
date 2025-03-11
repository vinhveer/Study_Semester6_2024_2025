package session_two.bai_tap_a1;

import java.util.Arrays;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        Product product1 = new Product(1, "Sản phầm 1");
        Product product2 = new Product(2, "Sản phẩm 2");

        OrderItem orderItem = new OrderItem(product1, 10, 200000, 2);
        OrderItem orderItem2 = new OrderItem(product2, 20, 500000, 2);

        List<OrderItem> orderItems = Arrays.asList(orderItem, orderItem2);

        OrderHeader orderHeader = new OrderHeader(1, "20/02/2025", "John Smith");

        Order order = new Order.Builder()
                .buildOrderHeader(orderHeader)
                .buildOrderItems(orderItems)
                .build();

        System.out.println(order.toString());
    }
}
