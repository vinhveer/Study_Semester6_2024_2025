package behavioral.state.atm;

import java.util.Scanner;

public class HanChe implements IATMState {
    @Override
    public void xuLyNapTien(ATM atm, int soTien) {
        int tong = atm.soTien + soTien;

        atm.soTien = tong;
        if (tong >= 5_000_000)
            atm.setState(new SanSang());

    }

    @Override
    public void xuLyRutTien(ATM atm) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Nhập số tiền cần rút <= " + atm.soTien + ": ");
        int soTien = scanner.nextInt();

        if (soTien <= atm.soTien) {
            atm.soTien -= soTien;

            if (atm.soTien == 0)
                atm.setState(new HetTien());

            System.out.println("Rút tiền thành công.");
        } else {
            System.out.println("Rút tiền thất bại");
        }
    }
}
