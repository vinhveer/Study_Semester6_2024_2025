package behavioral.state.atm;

public class Main {
    public static void main(String[] args) {
        ATM atm = new ATM();
        atm.napTien(10000000);

        atm.rutTien();
        atm.rutTien();
        atm.rutTien();
    }
}
