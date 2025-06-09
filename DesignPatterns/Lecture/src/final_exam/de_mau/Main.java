package final_exam.de_mau;

public class Main {
    public static void main(String[] args) {
        KhachHang khachHang = new KhachHang(0);

        DonHang donHang = new DonHang("TV", 1, 3000000);
        khachHang.themDonHang(donHang);
        khachHang.tinhTien();

        DonHang donHang2 = new DonHang("May rung", 2, 3000000);
        khachHang.themDonHang(donHang2);
        khachHang.tinhTien();

        DonHang donHang3 = new DonHang("May rung cam tay", 3, 3000000);
        khachHang.themDonHang(donHang3);
        khachHang.tinhTien();
    }
}
