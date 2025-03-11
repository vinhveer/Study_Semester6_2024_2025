package session_two.bai_tap_a1;

import java.util.List;

public class Order {
    private OrderHeader orderHeader;
    private List<OrderItem> orderItems;

    public Order(Builder builder) {
        this.orderHeader = builder.orderHeader;
        this.orderItems = builder.orderItems;
    }

    public double getTotalAmout() {
        double totalAmout = 0;
        for (OrderItem orderItem : orderItems) {
            totalAmout += orderItem.getTotalCost();
        }

        return totalAmout / orderItems.size();
    }

    @Override
    public String toString() {
        return "Order{" +
                "orderHeader=" + orderHeader +
                ", orderItems=" + orderItems +
                ", totalAmout=" + getTotalAmout() +
                '}';
    }

    public static class Builder {
        private OrderHeader orderHeader;
        private List<OrderItem> orderItems;

        Builder buildOrderHeader(OrderHeader orderHeader) {
            this.orderHeader = orderHeader;
            return this;
        }

        Builder buildOrderItems(List<OrderItem> orderItems) {
            this.orderItems = orderItems;
            return this;
        }

        public Order build() {
            return new Order(this);
        }
    }
}
