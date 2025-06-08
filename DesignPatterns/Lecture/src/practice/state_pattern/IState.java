package practice.state_pattern;

public interface IState {
    void xuLyNapTien(int soTien, ThueBao tb);
    void xuLyGoiDien(int soPhut, ThueBao tb);
    void xuLyInThongTin(ThueBao tb);
}
