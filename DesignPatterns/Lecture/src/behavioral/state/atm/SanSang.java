package behavioral.state.atm;

import java.util.Scanner;

public class SanSang implements IATMState {
    @Override
    public void xuLyNapTien(ATM atm, int soTien) {
        int tong = atm.soTien + soTien;
        atm.setSoTien(tong);
    }

    @Override
    public void xuLyRutTien(ATM atm) {
        System.out.println("Chọn số tiền cần rút: ");
        System.out.println("1. 50.000");
        System.out.println("2. 100.000");
        System.out.println("3. 200.000");
        System.out.println("4. 500.000");
        System.out.println("5. 1.000.000");
        System.out.println("Hoặc nhập số khác tùy ý: ");

        Scanner scanner = new Scanner(System.in);
        int lenhRut = scanner.nextInt();

        switch (lenhRut) {
            case 1:
                rutTien(50000, atm);
                break;
            case 2:
                rutTien(100000, atm);
                break;
            case 3:
                rutTien(200000, atm);
                break;
            case 4:
                rutTien(500000, atm);
                break;
            case 5:
                rutTien(1000000, atm);
                break;
            default:
                rutTien(lenhRut, atm);
                break;
        }
    }

    private void rutTien(int soTien, ATM atm) {
        if (soTien <= atm.soTien) {
            atm.soTien -= soTien;

            if (atm.soTien == 0)
                atm.setState(new HetTien());
            else if (atm.soTien < 5000000) {
                atm.setState(new HanChe());
            }

            System.out.println("Rút tiền thành công.");
        } else {
            System.out.println("Rút tiền thất bại");
        }
        System.out.println("Rút tiền thành công.");
    }
}
