package behavioral.observer.ca5;

public class Main {
    public static void main(String[] args) {
        ATM atm = new ATM();
        TaiKhoan taiKhoan = new TaiKhoan(5000, atm);

        taiKhoan.duaTheVaoATM();
        atm.rutTien(3000);
        taiKhoan.rutThe();
    }
}