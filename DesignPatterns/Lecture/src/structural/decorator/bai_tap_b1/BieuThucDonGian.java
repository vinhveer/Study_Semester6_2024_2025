package structural.decorator.bai_tap_b1;

public class BieuThucDonGian extends BieuThuc {
    float toanHang;
    float giaTri;

    public BieuThucDonGian(float giaTri) {
        this.giaTri = giaTri;
    }

    @Override
    public float giaTri() {
        return giaTri;
    }

    @Override
    public String bieuThuc() {
        return giaTri + "";
    }
}
