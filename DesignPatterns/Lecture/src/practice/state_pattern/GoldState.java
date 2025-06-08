package practice.state_pattern;

public class GoldState implements IState {
    @Override
    public void xuLyNapTien(int soTien, ThueBao tb) {
        tb.soDu = tb.soDu + soTien;
    }

    @Override
    public void xuLyGoiDien(int soPhut, ThueBao tb) {

    }

    @Override
    public void xuLyInThongTin(ThueBao tb) {
        System.out.println("Thông tin thuê bao " + tb.tenTB + ": " + tb.soDu);
        System.out.println("Trạng thái: Thường");
        System.out.println("Thời gian gọi còn lại: " + tb.soDu / (1200/60) + " giây");
    }
}
