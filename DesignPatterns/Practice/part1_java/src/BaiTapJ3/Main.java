package BaiTapJ3;

public class Main {
    public static void main(String[] args) {
        SinhVienNTU sv1 = new SinhVienIT("Nguyen Van A", 8, 7, 9);
        SinhVienNTU sv2 = new SinhVienBiz("Tran Thi B", 6, 7);

        sv1.inThongTin();
        System.out.println("-------------------");
        sv2.inThongTin();
    }
}
