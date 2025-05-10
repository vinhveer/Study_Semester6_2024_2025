package structural.decorator.bai_tap_b1;

public class Nhan extends BieuThucDecorator {
    float toanHang;

    public Nhan(BieuThuc bieuThuc, float toanHang) {
        super(bieuThuc);
        this.toanHang = toanHang;
    }

    @Override
    public float giaTri() {
        return super.giaTri() * toanHang;
    }

    @Override
    public String bieuThuc() {
        return "(" + super.bieuThuc() + ")" + " * " + toanHang;
    }
}
