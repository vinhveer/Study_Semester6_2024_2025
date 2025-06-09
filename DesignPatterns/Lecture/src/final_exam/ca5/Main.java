package final_exam.ca5;

public class Main {
    public static void main(String[] args) {
        ATM atm = new ATM();

        TaiKhoan taiKhoan = new TaiKhoan(1000000, atm);

        taiKhoan.dutThe();
        atm.rutTien(100000);

        taiKhoan.dutThe();
        atm.rutTien(3000000);

        taiKhoan.nhaThe();
    }
}
