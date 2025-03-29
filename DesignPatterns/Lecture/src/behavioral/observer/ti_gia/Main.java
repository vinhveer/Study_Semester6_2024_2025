package behavioral.observer.ti_gia;

public class Main {
    public static void main(String[] args) {
        TiGia tiGia = new TiGia();
        NhaDauTu a = new NhaDauTuA(tiGia, "John Doe");
        NhaDauTu b = new NhaDauTuB(tiGia, "Jame Smith");

        a.dangKy();
        b.dangKy();

        tiGia.thongBao(5);
        b.huyDangKy();
        tiGia.thongBao(-5);
    }
}
