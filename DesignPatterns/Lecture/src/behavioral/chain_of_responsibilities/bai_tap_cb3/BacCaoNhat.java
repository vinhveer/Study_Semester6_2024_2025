package behavioral.chain_of_responsibilities.bai_tap_cb3;

public class BacCaoNhat extends TienDienBacThang {
    TienDienBacThang bacTienKeTiep;

    public BacCaoNhat() {
    }

    @Override
    public TienDienBacThang keTiep(TienDienBacThang k) {
        bacTienKeTiep = k;
        return bacTienKeTiep;
    }

    @Override
    public double tinhTien(int soKW) {
        return soKW * gia + bacTienKeTiep.tinhTien(soKW);
    }
}
