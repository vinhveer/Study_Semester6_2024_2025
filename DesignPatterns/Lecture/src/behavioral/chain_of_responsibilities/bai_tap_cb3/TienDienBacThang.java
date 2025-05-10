package behavioral.chain_of_responsibilities.bai_tap_cb3;

public abstract class TienDienBacThang {
    int mucMin;
    int mucMax;
    double gia;

    public TienDienBacThang() {
    }

    public abstract TienDienBacThang keTiep(TienDienBacThang k);
    public abstract double tinhTien(int soKW);
}
