public class Main {
    public static void main(String[] args) {
        QuanLyNhanVien quanLyNhanVien = new QuanLyNhanVien();

        NhanVien nhanVien1 = new NhanVien("Nguyen Quang Vinh", (byte) 18, "Khanh Hoa", 20000000, 212);
        NhanVien nhanVien2 = new NhanVien("Truong Thanh Hieu", (byte) 23, "Phu Yen", 1000000, 90);
        NhanVien nhanVien3 = new NhanVien("Tran Thanh Tri", (byte) 25, "Lam Dong", 30000000, 190);
        NhanVien nhanVien4 = new NhanVien("Le Ngoc Minh Chau", (byte) 18, "Khanh Hoa", 10000000, 100);
        NhanVien nhanVien5 = new NhanVien("Nguyen Tra My", (byte) 18, "Khanh Hoa", 15000000, 200);

        quanLyNhanVien.nhanViens.add(nhanVien1);
        quanLyNhanVien.nhanViens.add(nhanVien2);
        quanLyNhanVien.nhanViens.add(nhanVien3);
        quanLyNhanVien.nhanViens.add(nhanVien4);
        quanLyNhanVien.nhanViens.add(nhanVien5);

        quanLyNhanVien.inDanhSach();
    }
}