package session_two.bai_tap_a1;

public class OrderItem {
    private Product product;
    private int quantity;
    private double unitPrice;
    private double discount;

    public OrderItem(Product product, int quantity, double unitPrice, double discount) {
        this.product = product;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.discount = discount;
    }

    public double getTotalCost()
    {
        return unitPrice * quantity;
    }

    @Override
    public String toString() {
        return "OrderItem{" +
                "product=" + product +
                ", quantity=" + quantity +
                ", unitPrice=" + unitPrice +
                ", discount=" + discount +
                ", totalCost=" + getTotalCost() +
                '}';
    }
}
