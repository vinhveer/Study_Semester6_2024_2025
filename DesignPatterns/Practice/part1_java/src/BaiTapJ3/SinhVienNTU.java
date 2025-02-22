package BaiTapJ3;

abstract class SinhVienNTU {
    private String hoTen;
    private String nganh;

    public SinhVienNTU(String hoTen, String nganh) {
        this.hoTen = hoTen;
        this.nganh = nganh;
    }

    public abstract double getDiemTB();

    public String getHocLuc() {
        double diemTB = getDiemTB();
        if (diemTB >= 8) return "Giỏi";
        else if (diemTB >= 6.5) return "Khá";
        else if (diemTB >= 5) return "Trung Bình";
        else return "Yếu";
    }

    public void inThongTin() {
        System.out.println("Họ tên: " + hoTen);
        System.out.println("Ngành: " + nganh);
        System.out.println("Điểm trung bình: " + getDiemTB());
        System.out.println("Học lực: " + getHocLuc());
    }
}
