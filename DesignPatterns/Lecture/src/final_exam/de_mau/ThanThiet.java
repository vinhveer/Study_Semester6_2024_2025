package final_exam.de_mau;

import java.util.List;

public class ThanThiet implements Hang {
    @Override
    public void tinhTien(KhachHang khachHang, List<DonHang> donHangs) {
        int tongTien = 0;

        for (DonHang donHang : donHangs) {
            System.out.println(donHang.toString());
            tongTien += donHang.donGia;
        }

        khachHang.diemTichLuy += tongTien / 5000;

        if (khachHang.diemTichLuy >= 1000 && khachHang.diemTichLuy < 2000) {
            khachHang.setState(new Bac());
            System.out.println("Hạng: Bạc");
        } else if (khachHang.diemTichLuy >= 2000) {
            khachHang.setState(new Vang());
            System.out.println("Hạng: Vàng");
        } else {
            System.out.println("Hạng: Thân thiết");
        }

        System.out.println("Tổng tiền: " + tongTien);
        System.out.println("Điểm tích luỹ: " + khachHang.diemTichLuy);
    }
}
