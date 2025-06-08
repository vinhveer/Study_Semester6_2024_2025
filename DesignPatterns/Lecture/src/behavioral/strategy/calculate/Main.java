package behavioral.strategy.calculate;

public class Main {
    public static void main(String[] args) {
        CalculateContext calculateContext = new CalculateContext();

        calculateContext.setTinhToan(new Cong());
        calculateContext.tinh(2, 3);
        calculateContext.setTinhToan(new Tru());
        calculateContext.tinh(3, 2);
        calculateContext.setTinhToan(new Nhan());
        calculateContext.tinh(3, 2);
        calculateContext.setTinhToan(new Chia());
        calculateContext.tinh(9, 3);
    }
}
