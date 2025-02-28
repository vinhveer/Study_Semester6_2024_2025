package session_one.bai_tap_a6;

public class Main {
    public static void main(String[] args) {
        UI ui1 = new UI("type1");
        UI ui2 = new UI("type2");
//        UI ui3 = new UI("type3");

        ui1.themSanPham(new SanPham("SP1", "San pham 1", 10, 1000));
        ui2.themSanPham(new SanPham("SP2", "San pham 2", 20, 2000));
        // ui3.themSanPham(new SanPham("SP3", "San pham 3", 30, 3000));

        ui1.hienThiSanPham();
        ui2.hienThiSanPham();
    }
}
