package session_one.bai_tap_j3;

public class SinhVienIT extends SinhVienNTU{
    private float diemJava, diemCSS, diemHTML;

    public SinhVienIT(String hoTen, float diemJava, float diemCSS, float diemHTML) {
        super(hoTen, "Information Technology");
        this.diemJava = diemJava;
        this.diemCSS = diemCSS;
        this.diemHTML = diemHTML;
    }

    @Override
    public double getDiemTB() {
        return (diemJava * 2 + diemCSS + diemHTML) / 4;
    }

    @Override
    public void inThongTin() {
        super.inThongTin();
        System.out.println("Điểm Java: " + diemJava);
        System.out.println("Điểm CSS: " + diemCSS);
        System.out.println("Điểm HTML: " + diemHTML);
        System.out.println("Điểm trung bình: " + getDiemTB());
        System.out.println("Học lực: " + getHocLuc());
    }
}