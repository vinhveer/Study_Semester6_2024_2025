package behavioral.chain_of_responsibilities.f88;

public abstract class NhanVienF88 {
    String chucVu;
    String ten;
    int hanMucDuyetVay;

    public NhanVienF88(String chucVu, String ten, int hanMucDuyetVay) {
        this.chucVu = chucVu;
        this.ten = ten;
        this.hanMucDuyetVay = hanMucDuyetVay;
    }

    abstract public void duyetChoVay(int khoanVay);
    abstract public NhanVienF88 capTren(NhanVienF88 capTren);
}
