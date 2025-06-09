package final_exam.de_mau;

import java.util.ArrayList;
import java.util.List;

public class KhachHang {
    int diemTichLuy;
    Hang hang;
    List<DonHang> donHangs = new ArrayList<DonHang>();

    public KhachHang(int diemTichLuy) {
        this.diemTichLuy = diemTichLuy;
        this.hang = new ThanThiet();
    }

    void setState(Hang hang) {
        this.hang = hang;
    }

    void themDonHang(DonHang donHang) {
        donHangs.add(donHang);
    }

    void tinhTien() {
        hang.tinhTien(this, donHangs);
    }
}
