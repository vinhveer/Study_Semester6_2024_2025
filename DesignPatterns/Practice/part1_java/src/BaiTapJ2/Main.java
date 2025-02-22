package BaiTapJ2;

public class Main {
    public static void main(String[] args) {
        QuanLyNhanVien quanLyNhanVien = new QuanLyNhanVien();

        // Khởi tạo 5 nhân viên
        NhanVien nv1 = new NhanVien("Nguyen Van A", 25, "Ha Noi", 10000000, 180);
        NhanVien nv2 = new NhanVien("Tran Thi B", 30, "Hai Phong", 12000000, 200);
        NhanVien nv3 = new NhanVien("Le Van C", 28, "Da Nang", 9000000, 170);
        NhanVien nv4 = new NhanVien("Pham Van D", 35, "Ho Chi Minh", 15000000, 220);
        NhanVien nv5 = new NhanVien("Hoang Thi E", 27, "Can Tho", 11000000, 190);

        quanLyNhanVien.them(nv1);
        quanLyNhanVien.them(nv2);
        quanLyNhanVien.them(nv3);
        quanLyNhanVien.them(nv4);
        quanLyNhanVien.them(nv5);

        quanLyNhanVien.inDS();
    }
}
