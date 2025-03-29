package behavioral.state.atm;

public class ATM {
    private IATMState state;
    int soTien;

    public ATM() {
        this.soTien = 0;
        this.state = new HetTien();
    }

    public void setState(IATMState state) {
        this.state = state;
    }

    public void setSoTien(int soTien) {
        this.soTien = soTien;
    }

    public void napTien(int soTien) {
        state.xuLyNapTien(this, soTien);
    }

    public void rutTien() {
        state.xuLyRutTien(this);
    }
}
