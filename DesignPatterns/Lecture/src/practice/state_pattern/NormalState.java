package practice.state_pattern;

public class NormalState implements IState {
    @Override
    public void xuLyNapTien(int soTien, ThueBao tb) {
        tb.soDu = tb.soDu + soTien;
        if (tb.soDu >= 100_000 && tb.soDu < 200_000) {
            tb.setState(new SliverState());
        } else if (tb.soDu >= 200_000) {
            tb.setState(new GoldState());
        }
    }

    @Override
    public void xuLyGoiDien(int soPhut, ThueBao tb) {
        int cuocGoi = 1800 * soPhut;
        tb.soDu = cuocGoi > tb.soDu ? 0 : tb.soDu - cuocGoi;

        System.out.println("Số dư thuê bao: " + tb.soDu);
        System.out.println("Trạng thái: Thường");
    }

    @Override
    public void xuLyInThongTin(ThueBao tb) {
        System.out.println("Thông tin thuê bao " + tb.tenTB + ": " + tb.soDu);
        System.out.println("Trạng thái: Thường");
        System.out.println("Thời gian gọi còn lại: " + tb.soDu / (1800/60) + " giây");
    }
}
