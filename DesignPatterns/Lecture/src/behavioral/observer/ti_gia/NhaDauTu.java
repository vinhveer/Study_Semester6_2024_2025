package behavioral.observer.ti_gia;

public abstract class NhaDauTu implements TheoDoiTiGia {
    protected TiGia tiGia;
    protected String ten;

    public NhaDauTu(TiGia tiGia, String ten) {
        this.tiGia = tiGia;
        this.ten = ten;
        // tiGia.dangKy(this);
    }

    public void dangKy() {
        tiGia.dangKy(this);
    }

    public void huyDangKy() {
        this.tiGia.huyDangKy(this);
    }
}
