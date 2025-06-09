package final_exam.de_mau;

public class DonHang {
    String ten;
    int soLuong;
    int donGia;

    public DonHang(String ten, int soLuong, int donGia) {
        this.ten = ten;
        this.soLuong = soLuong;
        this.donGia = donGia;
    }

    @Override
    public String toString() {
        return "DonHang{" +
                "ten='" + ten + '\'' +
                ", soLuong=" + soLuong +
                ", donGia=" + donGia +
                '}';
    }
}
