package BaiTapJ1;

public class Main {
    public static void main(String[] args) {
        NhanVien nhanVien1 = new NhanVien();
        nhanVien1.setTen("Nguyen Van An");
        nhanVien1.setTuoi(19);
        nhanVien1.setDiaChi("Nha Trang");
        nhanVien1.setTienLuong(2000000);
        nhanVien1.setTongSoGioLam(180);

        NhanVien nhanVien2 = new NhanVien("Tran Thanh Tri", 18, "Nha Trang", 200000, 180);

        System.out.println(nhanVien1.toString());
        System.out.println(nhanVien2.toString());
    }
}
