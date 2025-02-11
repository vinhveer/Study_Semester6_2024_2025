public class SinhVienIT extends SinhVienNTU {
    private float diemJava;
    private float diemCSS;
    private float diemHTML;

    public SinhVienIT(String hoTen, float diemJava, float diemCSS, float diemHTML) {
        super(hoTen, "Công nghệ thông tin");
        this.diemJava = diemJava;
        this.diemCSS = diemCSS;
        this.diemHTML = diemHTML;
    }

    @Override
    public double getDiemTB() {
        return (diemJava * 2 + diemCSS + diemHTML) / 4;
    }
}
