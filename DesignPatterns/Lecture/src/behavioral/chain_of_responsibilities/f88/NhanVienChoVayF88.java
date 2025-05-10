package behavioral.chain_of_responsibilities.f88;

public class NhanVienChoVayF88 extends NhanVienF88 {
    NhanVienF88 capTren;

    public NhanVienChoVayF88(String chucVu, String ten, int hanMucDuyetVay) {
        super(chucVu, ten, hanMucDuyetVay);
    }

    @Override
    public void duyetChoVay(int khoanVay) {
        if (khoanVay <= hanMucDuyetVay)
            System.out.println(chucVu + " " + ten + " đã duyệt cho vay " + khoanVay + " triệu đồng");
        else
            this.capTren.duyetChoVay(khoanVay);
    }

    @Override
    public NhanVienF88 capTren(NhanVienF88 capTren) {
        this.capTren = capTren;
        return this.capTren;
    }
}
