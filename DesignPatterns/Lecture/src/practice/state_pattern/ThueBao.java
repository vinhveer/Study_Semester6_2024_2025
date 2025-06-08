package practice.state_pattern;

public class ThueBao {
    String tenTB;
    int soDu;
    IState currentState;

    public ThueBao(String tenTB, int soDu, IState currentState) {
        this.tenTB = tenTB;
        this.soDu = soDu;
        this.currentState = currentState;
    }

    void napTien(int soTien) {
        currentState.xuLyNapTien(soTien, this);
    }

    public void goiDien(int soPhut) {
        currentState.xuLyGoiDien(soPhut, this);
    }

    public void inThongTin() {
        currentState.xuLyInThongTin(this);
    }

    public void setState(IState state) {
        this.currentState = state;
    }
}
