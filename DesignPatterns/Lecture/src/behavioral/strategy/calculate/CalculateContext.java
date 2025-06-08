package behavioral.strategy.calculate;

public class CalculateContext {
    Tinh tinhToan;

    public void setTinhToan(Tinh tinhToan) {
        this.tinhToan = tinhToan;
    }

    public void tinh(float a, float b) {
        System.out.println(tinhToan.tinh(a, b));
    }
}
