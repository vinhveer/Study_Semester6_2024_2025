abstract class SinhVienNTU {
    protected String hoTen;
    protected String nganh;

    public SinhVienNTU(String hoTen, String nganh) {
        this.hoTen = hoTen;
        this.nganh = nganh;
    }

    public abstract double getDiemTB();

    public String getHocLuc() {
        double diem = getDiemTB();
        if (diem >= 8) return "Giỏi";
        if (diem >= 6.5) return "Khá";
        if (diem >= 5) return "Trung bình";
        return "Yếu";
    }

    public void inThongTin() {
        System.out.println("Họ tên: " + hoTen);
        System.out.println("Ngành: " + nganh);
        System.out.println("Điểm trung bình: " + getDiemTB());
        System.out.println("Học lực: " + getHocLuc());
    }
}
