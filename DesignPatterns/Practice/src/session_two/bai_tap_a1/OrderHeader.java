package session_two.bai_tap_a1;

public class OrderHeader {
    private int orderId;
    private String orderDate;
    private String customerName;

    public OrderHeader(int orderId, String orderDate, String customerName) {
        this.orderId = orderId;
        this.orderDate = orderDate;
        this.customerName = customerName;
    }

    @Override
    public String toString() {
        return "OrderHeader{" +
                "orderId=" + orderId +
                ", orderDate='" + orderDate + '\'' +
                ", customerName='" + customerName + '\'' +
                '}';
    }
}
