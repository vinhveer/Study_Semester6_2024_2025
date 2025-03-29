package behavioral.state.atm;

public class HetTien implements IATMState {
    @Override
    public void xuLyNapTien(ATM atm, int soTien) {
        int tongSoTien = soTien + atm.soTien;

        atm.setSoTien(tongSoTien);
        if (tongSoTien >= 5_000_000)
            atm.setState(new SanSang());
        else if (tongSoTien > 0)
            atm.setState(new HanChe());
    }

    @Override
    public void xuLyRutTien(ATM atm) {
        System.out.println("Không thể rút tiền vì hết tiền");
    }
}
