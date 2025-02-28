package session_one.bai_tap_j3;

public class SinhVienBiz extends SinhVienNTU {
    private float diemMarketing, diemSales;

    public SinhVienBiz(String hoTen, float diemMarketing, float diemSales) {
        super(hoTen, "Marketing");
        this.diemMarketing = diemMarketing;
        this.diemSales = diemSales;
    }

    @Override
    public double getDiemTB() {
        return (diemMarketing * 2 + diemSales) / 3;
    }

    @Override
    public void inThongTin() {
        super.inThongTin();
        System.out.println("Điểm Marketing: " + diemMarketing);
        System.out.println("Điểm Sales: " + diemSales);
        System.out.println("Điểm trung bình: " + getDiemTB());
        System.out.println("Học lực: " + getHocLuc());
    }
}