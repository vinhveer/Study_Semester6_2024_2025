package behavioral.chain_of_responsibilities.bai_tap_cb3;

public class BacThongThuong extends TienDienBacThang {
    TienDienBacThang bacTienKeTiep;

    public BacThongThuong() {
    }

    @Override
    public TienDienBacThang keTiep(TienDienBacThang k) {
        bacTienKeTiep = k;
        return bacTienKeTiep;
    }

    @Override
    public double tinhTien(int soKW) {
        if (soKW <= mucMax) {
            return soKW * gia;
        } else {
            return (mucMax - mucMin) * gia + bacTienKeTiep.tinhTien(soKW - mucMax);
        }
    }
}
