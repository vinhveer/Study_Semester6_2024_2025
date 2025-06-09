package final_exam.de_mau;

import java.util.List;

public class Vang implements Hang {
    @Override
    public void tinhTien(KhachHang khachHang, List<DonHang> donHangs) {
        int tongTien = 0;

        for (DonHang donHang : donHangs) {
            System.out.println(donHang.toString());
            tongTien += donHang.donGia;
        }

        khachHang.diemTichLuy += tongTien / 5000;

        System.out.println("Hạng: Vàng");

        int chietKhau = (int) (tongTien * 0.02);

        System.out.println("Tổng tiền: " + (tongTien - chietKhau));
        System.out.println("Điểm tích luỹ: " + khachHang.diemTichLuy);
    }
}
