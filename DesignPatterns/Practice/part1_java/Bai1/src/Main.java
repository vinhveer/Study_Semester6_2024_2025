public class Main {
    public static void main(String[] args) {
        NhanVien nhanVien1 = new NhanVien();

        nhanVien1.setTen("Nguyen Quang Vinh");
        nhanVien1.setTuoi((byte) 18);
        nhanVien1.setDiaChi("Khanh Hoa");
        nhanVien1.setTienLuong(20000000);
        nhanVien1.setTongSoGioLam(198);

        NhanVien nhanVien2 = new NhanVien("Nguyen Van An", (byte) 18, "Khanh Hoa", 20000000, 212);

        System.out.println(nhanVien1);
        System.out.println(nhanVien2);
    }
}