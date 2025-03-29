package behavioral.chain_of_responsibilities;

public class ChuTich extends NhanVienF88 {
    public ChuTich(String chucVu, String ten, int hanMucDuyetVay) {
        super(chucVu, ten, hanMucDuyetVay);
    }

    @Override
    public void duyetChoVay(int khoanVay) {
        if (khoanVay <= hanMucDuyetVay) {
            System.out.println(chucVu + " " + ten + " đã duyệt cho vay " + khoanVay + " triệu đồng");
        } else {
            System.out.println("Ra ngân hàng ngay");
        }
    }

    @Override
    public NhanVienF88 capTren(NhanVienF88 capTren) {
        return null;
    }
}
